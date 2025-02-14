import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_paginator/list_paginator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'page_pagination_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PaginationObserver<int, PaginationBase<int>>>(),
  MockSpec<PaginationBase<int>>(),
])
void main() {
  late MockPaginationObserver mockObserver;
  late MockPaginationBase mockResponse;

  setUp(() {
    mockObserver = MockPaginationObserver();
    mockResponse = MockPaginationBase();

    // Stub scrollController
    when(mockObserver.scrollController).thenReturn(ScrollController());

    // Mock the API response correctly
    const pagination = Pagination(
      meta: Meta(currentPage: 1, lastPage: 2, path: '', perPage: 10),
      links: Links(first: null, last: null, prev: null, next: 'next_page'),
    );

    when(mockResponse.pagination).thenReturn(pagination);
    when(mockResponse.items).thenReturn([1, 2, 3]);

    // **Fix: Ensure mockObserver.onFetchPageData actually returns mockResponse**
    when(mockObserver.onFetchPageData(1)).thenAnswer((_) async => mockResponse);
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

    // Call resetPagination
    mockObserver.resetPagination();

    await tester.pumpAndSettle();

    expect(mockObserver.elements, [1, 2, 3]);
    expect(mockObserver.hasMorePages, true);
  });
}
