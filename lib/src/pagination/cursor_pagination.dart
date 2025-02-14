import 'package:flutter/widgets.dart';
import 'package:list_paginator_nerdzlab/list_paginator_nerdzlab.dart';

/// A class that manages cursor-based pagination for a scrollable list of items.
///
/// This observer handles fetching more items when the user scrolls to the bottom of the list
/// and provides various callbacks for customizing the pagination behavior.
///
/// [M] represents the model type of the paginated items.
/// [T] extends [CursorPaginationBase] and represents the pagination response type.
class CursorPaginationObserver<M, T extends CursorPaginationBase<M>> {
  final ScrollController scrollController = ScrollController();

  /// Callback function to fetch data from the server.
  final CursorPaginationRequest<M> onFetchPageData;

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

  /// The initial cursor value from which pagination starts.
  final String initialCursor;

  /// The scroll threshold to trigger loading more items.
  final double scrollThreshold;

  /// Returns the list of paginated items.
  List<M> get elements => _elements;

  /// Returns the next cursor value for pagination.
  String get nextCursor => _nextCursor;

  /// Checks if there are more pages to fetch.
  bool get hasMorePages => _pagination?.links.next != null;

  /// Checks if there are previous pages available.
  bool get hasPreviousPages => _pagination?.links.prev != null;

  /// List of paginated elements.
  final List<M> _elements = [];

  /// Stores the next cursor for fetching more items.
  String _nextCursor;

  /// Flag indicating whether a page is currently loading.
  bool _isLoading = false;

  /// Holds pagination metadata such as next page cursor.
  CursorPagination? _pagination;

  /// Constructor for initializing the cursor-based pagination observer.
  ///
  /// [onLoadPageData] is required to fetch data pages.
  /// [onResult] is required to retrieve the list of items.
  /// Optionally, [onError], [onStartLoading], and [onStopLoading] can be provided.
  CursorPaginationObserver({
    required this.onFetchPageData,
    required this.getObserverItems,
    this.getResponseItemsResult,
    this.onError,
    this.onStartLoading,
    this.onStopLoading,
    this.initialCursor = '',
    this.scrollThreshold = 200.0,
    this.useScrollNotifications = false,
    this.needToClearElementsIfFirstPage = true,
  }) : _nextCursor = initialCursor {
    if (!useScrollNotifications) {
      scrollController.addListener(_onScroll);
    }
  }

  /// Scroll event listener to trigger pagination when reaching the threshold.
  void _onScroll() {
    if (scrollController.positions.isNotEmpty &&
        scrollController.position.pixels + scrollThreshold >=
            scrollController.position.maxScrollExtent &&
        !_isLoading &&
        hasMorePages) {
      _fetchMoreItems(cursor: nextCursor);
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
      _fetchMoreItems(cursor: nextCursor);
    }
  }

  /// Fetches more items from the server using cursor-based pagination.
  Future<void> _fetchMoreItems({String? cursor}) async {
    _isLoading = true;
    onStartLoading?.call();

    try {
      final response = await onFetchPageData.call(cursor ?? '');

      if (cursor == null && needToClearElementsIfFirstPage) {
        _elements.clear();
        _elements.addAll(response.items);
      } else {
        _elements.addAll(response.items);
      }

      _pagination = response.pagination;
      _nextCursor = response.pagination.meta.nextCursor ?? '';

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
  void resetPagination({bool clearElementsList = false}) {
    _nextCursor = initialCursor;
    if (clearElementsList) {
      _elements.clear();
    }
    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(0);
    }
    _fetchMoreItems(cursor: _nextCursor);
  }

  /// Disposes resources by removing scroll listeners and disposing of the scroll controller.
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
  }
}
