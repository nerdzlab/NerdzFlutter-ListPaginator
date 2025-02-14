# List Paginator

A Flutter plugin that provides easy-to-use pagination functionality for lists, supporting both cursor-based and page-based pagination.

## Features

- Cursor-based pagination support
- Page-based pagination support
- Built-in pagination state management
- Customizable pagination actions
- Easy integration with existing list views

## Installation

Add this line to your `pubspec.yaml`:

```yaml
dependencies:
  list_paginator: ^1.0.1
```

## Usage

### Import the package

```dart
import 'package:list_paginator_nerdzlab/list_paginator.dart';
```
### Response Example

```dart
class Item {
  final int id;
  final String name;
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
```

### Cursor-based Pagination

```dart
final pagination = CursorPaginationObserver<Item, CursorPaginationResponse<Item>>(
      onFetchPageData: fetchCursorItems,
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
```

### Page-based Pagination

```dart
final pagination = PaginationObserver<Item, PaginationResponse<Item>>(
      onFetchPageData: fetchItems,
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
```

### Usage simple pagination

```dart
ListView(
      shrinkWrap: true,
      controller: pagination.scrollController,
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
```

### Usage notification scroll

```dart
NotificationListener(
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
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.