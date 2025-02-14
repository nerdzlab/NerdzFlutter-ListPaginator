// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'links': instance.links,
    };
