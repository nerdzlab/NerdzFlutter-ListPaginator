import 'package:example/pages/cursor_pagination.dart';
import 'package:example/pages/page_pagination.dart';
import 'package:flutter/material.dart';
import 'package:list_paginator/list_paginator.dart';

/// Mock data model
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}

/// Mock pagination response
class PaginationResponse<T> extends PaginationBase<T> {
  PaginationResponse({required super.items, required super.pagination});
}

/// Mock cursor pagination response
class CursorPaginationResponse<T> extends CursorPaginationBase<T> {
  CursorPaginationResponse({required super.items, required super.pagination});
}

/// Mock API call
Future<PaginationResponse<Item>> fetchItems(int page) async {
  await Future.delayed(const Duration(seconds: 2));
  List<Item> items = List.generate(
    15,
    (index) => Item(
      id: index + (page - 1) * 10,
      name: 'Item page=$page index=$index',
    ),
  );
  return PaginationResponse(
    items: items,
    pagination: Pagination(
      meta: Meta(currentPage: page, lastPage: 4, perPage: 15, path: ''),
      links: Links(
        next: page < 4 ? 'nextPageUrl' : null,
        prev: page > 1 ? 'prevPageUrl' : null,
        first: '',
        last: '',
      ),
    ),
  );
}

/// Mock API call
Future<CursorPaginationResponse<Item>> fetchCursorItems(String page) async {
  if (page.isEmpty) {
    page = '1';
  }
  int currentPage = int.parse(page);
  int nextPage = currentPage + 1;
  await Future.delayed(const Duration(seconds: 2));
  List<Item> items = List.generate(
    15,
    (index) => Item(
      id: index + (currentPage - 1) * 10,
      name: 'Item page=$page index=$index',
    ),
  );
  return CursorPaginationResponse(
    items: items,
    pagination: CursorPagination(
      meta: MetaCursor(
        nextCursor: nextPage.toString(),
        prevCursor: (currentPage - 1).toString(),
        perPage: 15,
        path: '',
      ),
      links: Links(
        next: currentPage < 4 ? nextPage.toString() : null,
        prev: currentPage > 1 ? (currentPage - 1).toString() : null,
        first: '1',
        last: '',
      ),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaginationMainScreen(),
    );
  }
}

class PaginationMainScreen extends StatelessWidget {
  const PaginationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Pagination Package'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PaginatedListScreen();
                    },
                  ),
                );
              },
              child: const Text(
                'Page pagination',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CursorPaginatedListScreen();
                    },
                  ),
                );
              },
              child: const Text(
                'Cursor pagination',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PaginatedListScreen(
                        useScrollNotification: true,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Notification page pagination',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CursorPaginatedListScreen(
                        useScrollNotification: true,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Notification cursor pagination',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
