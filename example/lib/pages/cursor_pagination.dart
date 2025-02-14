import 'package:flutter/material.dart';
import 'package:list_paginator_nerdzlab/list_paginator_nerdzlab.dart';

import '../main.dart';

class CursorPaginatedListScreen extends StatefulWidget {
  CursorPaginatedListScreen({this.useScrollNotification = false});

  bool useScrollNotification;

  @override
  _CursorPaginatedListScreenState createState() =>
      _CursorPaginatedListScreenState();
}

class _CursorPaginatedListScreenState extends State<CursorPaginatedListScreen> {
  late CursorPaginationObserver<Item, CursorPaginationResponse<Item>>
      _paginationObserver;

  bool _isLoading = false;
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _paginationObserver =
        CursorPaginationObserver<Item, CursorPaginationResponse<Item>>(
      onFetchPageData: fetchCursorItems,
      useScrollNotifications: widget.useScrollNotification,
      initialCursor: '1',
      getObserverItems: (items) {
        setState(() {
          _items = items;
        });
      },
      onStartLoading: () => setState(() {
        _isLoading = true;
      }),
      onStopLoading: () => setState(() {
        _isLoading = false;
      }),
    );
    _paginationObserver.resetPagination();
  }

  @override
  void dispose() {
    _paginationObserver.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.useScrollNotification
            ? const Text(
                'Scroll notification cursor paginated List',
              )
            : const Text(
                'cursor  paginated List',
              ),
      ),
      body: widget.useScrollNotification
          ? _buildScrollNotificationListView()
          : _buildListView(),
    );
  }

  _buildScrollNotificationListView() {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollNotification) {
          _paginationObserver.handleScrollNotification(notification);
        }
        return false;
      },
      child: ListView(
        shrinkWrap: true,
        controller: _paginationObserver.scrollController,
        children: [
          ..._items.map(
            (item) {
              return ListTile(
                title: Text(
                  item.name,
                ),
              );
            },
          ),
          if (_isLoading) ...[
            const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      shrinkWrap: true,
      controller: _paginationObserver.scrollController,
      children: [
        ..._items.map(
          (item) {
            return ListTile(
              title: Text(
                item.name,
              ),
            );
          },
        ),
        if (_isLoading) ...[
          const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ],
    );
  }
}
