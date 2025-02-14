// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CursorPaginationImpl _$$CursorPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$CursorPaginationImpl(
      meta: MetaCursor.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CursorPaginationImplToJson(
        _$CursorPaginationImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'links': instance.links,
    };
