// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_cursor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaCursorImpl _$$MetaCursorImplFromJson(Map<String, dynamic> json) =>
    _$MetaCursorImpl(
      nextCursor: json['next_cursor'] as String?,
      from: (json['from'] as num?)?.toInt(),
      prevCursor: json['prev_cursor'] as String?,
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaCursorImplToJson(_$MetaCursorImpl instance) =>
    <String, dynamic>{
      'next_cursor': instance.nextCursor,
      'from': instance.from,
      'prev_cursor': instance.prevCursor,
      'path': instance.path,
      'per_page': instance.perPage,
    };
