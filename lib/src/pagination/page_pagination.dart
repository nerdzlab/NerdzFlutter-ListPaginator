import 'package:flutter/widgets.dart';
import 'package:list_paginator_nerdzlab/list_paginator_nerdzlab.dart';

/// A class that manages pagination for a scrollable list of items.
///
/// This observer handles loading more items when the user scrolls to the bottom of the list,
/// and provides various callbacks for customizing the pagination behavior.
///
/// [M] represents the model type of the paginated items.
/// [T] extends [PaginationBase] and represents the pagination response type.
class PaginationObserver<M, T extends PaginationBase<M>> {
  final ScrollController scrollController = ScrollController();

  /// Callback function to fetch data from the server.
  final PaginationRequest<M> onFetchPageData;

  /// Callback function to handle errors during data fetching.
  final ErrorCallback? onError;

  /// Callback function called when loading starts.
  final VoidCallback? onStartLoading;

  /// Callback function called when loading stops.
  final VoidCallback? onStopLoading;

  /// Callback function to return the current list of [elements].
  final TypeCallback<M> getObserverItems;

  /// Callback function to return items from the response.
  final TypeCallback<M>? getResponseItemsResult;

  /// Indicates whether to use [ScrollNotification] instead of [scrollController.addListener].
  final bool useScrollNotifications;

  /// Indicates whether to clear [elements] when [currentPage] is 1.
  final bool needToClearElementsIfFirstPage;

  /// The initial page number to start pagination from.
  final int initialPage;

  /// The scroll threshold to trigger loading more items.
  final double scrollThreshold;

  /// The current page number being loaded.
  int _currentPage;

  /// Flag indicating whether a page is currently loading.
  bool _isLoading = false;

  /// List of paginated elements.
  final List<M> _elements = [];

  /// Holds pagination metadata such as next and previous page links.
  Pagination? _pagination;

  /// Constructor for initializing the pagination observer.
  ///
  /// [onFetchPageData] is required to fetch data pages.
  /// [getObserverItems] is required to retrieve the current list of items.
  /// Optionally, [getResponseItemsResult], [onError], [onStartLoading], and [onStopLoading] can be provided.
  PaginationObserver({
    required this.onFetchPageData,
    required this.getObserverItems,
    this.getResponseItemsResult,
    this.onError,
    this.onStartLoading,
    this.onStopLoading,
    this.initialPage = 1,
    this.scrollThreshold = 200.0,
    this.useScrollNotifications = false,
    this.needToClearElementsIfFirstPage = true,
  }) : _currentPage = initialPage {
    if (!useScrollNotifications) {
      scrollController.addListener(_onScroll);
    }
  }

  /// Returns the list of paginated items.
  List<M> get elements => _elements;

  /// Returns the current page number.
  int get currentPage => _currentPage;

  /// Checks if there are more pages to fetch.
  bool get hasMorePages => _pagination?.links.next != null;

  /// Checks if there are previous pages available.
  bool get hasPreviousPages => _pagination?.links.prev != null;

  /// Scroll event listener to trigger pagination when reaching the threshold.
  _onScroll() {
    if (scrollController.positions.isNotEmpty &&
        scrollController.position.pixels + scrollThreshold >=
            scrollController.position.maxScrollExtent &&
        hasMorePages &&
        !_isLoading) {
      _fetchMoreItems(page: currentPage + 1);
    }
  }

  /// Handles [ScrollNotification] events to trigger pagination.
  ///
  /// This is useful when using custom scroll behaviors such as [NestedScrollView].
  handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.pixels + scrollThreshold >
            notification.metrics.maxScrollExtent &&
        !_isLoading &&
        hasMorePages) {
      _fetchMoreItems(page: currentPage + 1);
    }
  }

  /// Fetches more items from the server for the given [page].
  Future _fetchMoreItems({int page = 1}) async {
    _isLoading = true;
    onStartLoading?.call();

    try {
      final response = await onFetchPageData.call(page);

      if (page == 1 && needToClearElementsIfFirstPage) {
        _elements.clear();
        _elements.addAll(response.items);
      } else {
        _elements.addAll(response.items);
      }

      _pagination = response.pagination;
      _currentPage = response.pagination.meta.currentPage;

      getObserverItems.call(elements);
      getResponseItemsResult?.call(response.items);
    } catch (error) {
      onError?.call(error as Exception);
    } finally {
      _isLoading = false;
      onStopLoading?.call();
    }
  }

  /// Resets pagination and optionally clears the elements list.
  ///
  /// If [clearElementsList] is true, all loaded items will be removed.
  resetPagination({bool clearElementsList = false}) {
    _currentPage = initialPage;
    if (clearElementsList) {
      _elements.clear();
    }
    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(0);
    }
    _fetchMoreItems(page: 1);
  }

  /// Disposes resources by removing scroll listeners and disposing of the scroll controller.
  dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
  }
}
