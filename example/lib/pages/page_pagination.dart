import 'package:flutter/material.dart';
import 'package:list_paginator/list_paginator.dart';

import '../main.dart';

class PaginatedListScreen extends StatefulWidget {
  PaginatedListScreen({this.useScrollNotification = false});

  bool useScrollNotification;

  @override
  _PaginatedListScreenState createState() => _PaginatedListScreenState();
}

class _PaginatedListScreenState extends State<PaginatedListScreen> {
  late PaginationObserver<Item, PaginationResponse<Item>> _paginationObserver;

  bool _isLoading = false;
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _paginationObserver = PaginationObserver<Item, PaginationResponse<Item>>(
      onFetchPageData: fetchItems,
      useScrollNotifications: widget.useScrollNotification,
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
                'Scroll notification paginated List',
              )
            : const Text(
                'Paginated List',
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
