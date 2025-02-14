// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CursorPagination _$CursorPaginationFromJson(Map<String, dynamic> json) {
  return _CursorPagination.fromJson(json);
}

/// @nodoc
mixin _$CursorPagination {
  MetaCursor get meta => throw _privateConstructorUsedError;
  Links get links => throw _privateConstructorUsedError;

  /// Serializes this CursorPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursorPaginationCopyWith<CursorPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursorPaginationCopyWith<$Res> {
  factory $CursorPaginationCopyWith(
          CursorPagination value, $Res Function(CursorPagination) then) =
      _$CursorPaginationCopyWithImpl<$Res, CursorPagination>;
  @useResult
  $Res call({MetaCursor meta, Links links});

  $MetaCursorCopyWith<$Res> get meta;
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class _$CursorPaginationCopyWithImpl<$Res, $Val extends CursorPagination>
    implements $CursorPaginationCopyWith<$Res> {
  _$CursorPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaCursor,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ) as $Val);
  }

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCursorCopyWith<$Res> get meta {
    return $MetaCursorCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CursorPaginationImplCopyWith<$Res>
    implements $CursorPaginationCopyWith<$Res> {
  factory _$$CursorPaginationImplCopyWith(_$CursorPaginationImpl value,
          $Res Function(_$CursorPaginationImpl) then) =
      __$$CursorPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MetaCursor meta, Links links});

  @override
  $MetaCursorCopyWith<$Res> get meta;
  @override
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class __$$CursorPaginationImplCopyWithImpl<$Res>
    extends _$CursorPaginationCopyWithImpl<$Res, _$CursorPaginationImpl>
    implements _$$CursorPaginationImplCopyWith<$Res> {
  __$$CursorPaginationImplCopyWithImpl(_$CursorPaginationImpl _value,
      $Res Function(_$CursorPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? links = null,
  }) {
    return _then(_$CursorPaginationImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaCursor,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CursorPaginationImpl implements _CursorPagination {
  const _$CursorPaginationImpl({required this.meta, required this.links});

  factory _$CursorPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursorPaginationImplFromJson(json);

  @override
  final MetaCursor meta;
  @override
  final Links links;

  @override
  String toString() {
    return 'CursorPagination(meta: $meta, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursorPaginationImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta, links);

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursorPaginationImplCopyWith<_$CursorPaginationImpl> get copyWith =>
      __$$CursorPaginationImplCopyWithImpl<_$CursorPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursorPaginationImplToJson(
      this,
    );
  }
}

abstract class _CursorPagination implements CursorPagination {
  const factory _CursorPagination(
      {required final MetaCursor meta,
      required final Links links}) = _$CursorPaginationImpl;

  factory _CursorPagination.fromJson(Map<String, dynamic> json) =
      _$CursorPaginationImpl.fromJson;

  @override
  MetaCursor get meta;
  @override
  Links get links;

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursorPaginationImplCopyWith<_$CursorPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
