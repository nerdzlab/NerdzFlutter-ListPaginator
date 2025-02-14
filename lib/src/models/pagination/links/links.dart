import 'package:freezed_annotation/freezed_annotation.dart';

part 'links.freezed.dart';
part 'links.g.dart';

@freezed
class Links with _$Links {
  const factory Links({
    required String? first,
    required String? last,
    required String? prev,
    required String? next,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}
