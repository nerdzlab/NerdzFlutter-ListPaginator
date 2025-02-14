import 'pagination/cursor_pagination/cursor_pagination.dart';

abstract class CursorPaginationBase<M> {
  final CursorPagination pagination;
  final List<M> items;

  CursorPaginationBase({required this.pagination, required this.items});

  factory CursorPaginationBase.fromJson(Map<String, dynamic> json) =>
      throw UnimplementedError();
}
