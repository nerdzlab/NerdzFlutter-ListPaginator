import 'pagination/pagination.dart';

abstract class PaginationBase<M> {
  final Pagination pagination;
  final List<M> items;

  PaginationBase({required this.pagination, required this.items});

  factory PaginationBase.fromJson(Map<String, dynamic> json) =>
      throw UnimplementedError();
}
