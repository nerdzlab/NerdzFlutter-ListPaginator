import 'package:freezed_annotation/freezed_annotation.dart';

import '../links/links.dart';
import '../meta_cursor/meta_cursor.dart';

part 'cursor_pagination.freezed.dart';
part 'cursor_pagination.g.dart';

@freezed
class CursorPagination with _$CursorPagination {
  const factory CursorPagination({
    required MetaCursor meta,
    required Links links,
  }) = _CursorPagination;

  factory CursorPagination.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationFromJson(json);
}
