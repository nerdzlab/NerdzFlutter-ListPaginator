import 'package:freezed_annotation/freezed_annotation.dart';

import 'links/links.dart';
import 'meta/meta.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required Meta meta,
    required Links links,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
