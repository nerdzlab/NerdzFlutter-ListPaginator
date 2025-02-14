import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_cursor.freezed.dart';
part 'meta_cursor.g.dart';

@freezed
class MetaCursor with _$MetaCursor {
  const factory MetaCursor({
    @JsonKey(name: 'next_cursor') required String? nextCursor,
    int? from,
    @JsonKey(name: 'prev_cursor') required String? prevCursor,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
  }) = _MetaCursor;

  factory MetaCursor.fromJson(Map<String, dynamic> json) =>
      _$MetaCursorFromJson(json);
}
