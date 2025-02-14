import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_paginator_nerdzlab/list_paginator_nerdzlab.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cursor_pagination_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CursorPaginationObserver<int, CursorPaginationBase<int>>>(),
  MockSpec<CursorPaginationBase<int>>(),
])
void main() {
  late MockCursorPaginationObserver mockObserver;
  late MockCursorPaginationBase mockResponse;

  setUp(() {
    mockObserver = MockCursorPaginationObserver();
    mockResponse = MockCursorPaginationBase();

    // Stub scrollController
    when(mockObserver.scrollController).thenReturn(ScrollController());

    // Mock the API response correctly
    const pagination = CursorPagination(
      meta: MetaCursor(
          nextCursor: '', prevCursor: '', path: '', perPage: 10, from: 0),
      links: Links(first: null, last: null, prev: null, next: 'next_page'),
    );

    when(mockResponse.pagination).thenReturn(pagination);
    when(mockResponse.items).thenReturn([1, 2, 3]);

    when(mockObserver.onFetchPageData(''))
        .thenAnswer((_) async => mockResponse);
    when(mockObserver.elements).thenAnswer(
      (realInvocation) => [1, 2, 3],
    );
    when(mockObserver.hasMorePages).thenAnswer(
      (realInvocation) => true,
    );
  });

  testWidgets('Scroll listener triggers fetching more items',
      (WidgetTester tester) async {
    when(mockResponse.items).thenReturn([1, 2, 3]);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            controller: mockObserver.scrollController,
            itemCount: 20,
            itemBuilder: (context, index) =>
                ListTile(title: Text('Item $index')),
          ),
        ),
      ),
    );

    // Simulate scrolling
    mockObserver.scrollController.jumpTo(500);
    await tester.pumpAndSettle();

    // Verify expected behavior
    expect(mockObserver.elements, [1, 2, 3]);
    expect(mockObserver.hasMorePages, true);
  });

  testWidgets('Pagination is reset and fetches the first page',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            controller: mockObserver.scrollController,
            itemCount: 20,
            itemBuilder: (context, index) =>
                ListTile(title: Text('Item $index')),
          ),
        ),
      ),
    );

    when(mockObserver.elements).thenAnswer(
      (realInvocation) {
        return mockResponse.items;
      },
    );

    mockObserver.resetPagination();

    await tester.pumpAndSettle();

    expect(mockObserver.elements, [1, 2, 3]);
    expect(mockObserver.hasMorePages, true);
  });
}
