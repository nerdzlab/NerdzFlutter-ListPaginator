// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_cursor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaCursor _$MetaCursorFromJson(Map<String, dynamic> json) {
  return _MetaCursor.fromJson(json);
}

/// @nodoc
mixin _$MetaCursor {
  @JsonKey(name: 'next_cursor')
  String? get nextCursor => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_cursor')
  String? get prevCursor => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;

  /// Serializes this MetaCursor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCursorCopyWith<MetaCursor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCursorCopyWith<$Res> {
  factory $MetaCursorCopyWith(
          MetaCursor value, $Res Function(MetaCursor) then) =
      _$MetaCursorCopyWithImpl<$Res, MetaCursor>;
  @useResult
  $Res call(
      {@JsonKey(name: 'next_cursor') String? nextCursor,
      int? from,
      @JsonKey(name: 'prev_cursor') String? prevCursor,
      String path,
      @JsonKey(name: 'per_page') int perPage});
}

/// @nodoc
class _$MetaCursorCopyWithImpl<$Res, $Val extends MetaCursor>
    implements $MetaCursorCopyWith<$Res> {
  _$MetaCursorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextCursor = freezed,
    Object? from = freezed,
    Object? prevCursor = freezed,
    Object? path = null,
    Object? perPage = null,
  }) {
    return _then(_value.copyWith(
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      prevCursor: freezed == prevCursor
          ? _value.prevCursor
          : prevCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaCursorImplCopyWith<$Res>
    implements $MetaCursorCopyWith<$Res> {
  factory _$$MetaCursorImplCopyWith(
          _$MetaCursorImpl value, $Res Function(_$MetaCursorImpl) then) =
      __$$MetaCursorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'next_cursor') String? nextCursor,
      int? from,
      @JsonKey(name: 'prev_cursor') String? prevCursor,
      String path,
      @JsonKey(name: 'per_page') int perPage});
}

/// @nodoc
class __$$MetaCursorImplCopyWithImpl<$Res>
    extends _$MetaCursorCopyWithImpl<$Res, _$MetaCursorImpl>
    implements _$$MetaCursorImplCopyWith<$Res> {
  __$$MetaCursorImplCopyWithImpl(
      _$MetaCursorImpl _value, $Res Function(_$MetaCursorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaCursor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextCursor = freezed,
    Object? from = freezed,
    Object? prevCursor = freezed,
    Object? path = null,
    Object? perPage = null,
  }) {
    return _then(_$MetaCursorImpl(
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      prevCursor: freezed == prevCursor
          ? _value.prevCursor
          : prevCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaCursorImpl implements _MetaCursor {
  const _$MetaCursorImpl(
      {@JsonKey(name: 'next_cursor') required this.nextCursor,
      this.from,
      @JsonKey(name: 'prev_cursor') required this.prevCursor,
      required this.path,
      @JsonKey(name: 'per_page') required this.perPage});

  factory _$MetaCursorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaCursorImplFromJson(json);

  @override
  @JsonKey(name: 'next_cursor')
  final String? nextCursor;
  @override
  final int? from;
  @override
  @JsonKey(name: 'prev_cursor')
  final String? prevCursor;
  @override
  final String path;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;

  @override
  String toString() {
    return 'MetaCursor(nextCursor: $nextCursor, from: $from, prevCursor: $prevCursor, path: $path, perPage: $perPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaCursorImpl &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.prevCursor, prevCursor) ||
                other.prevCursor == prevCursor) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nextCursor, from, prevCursor, path, perPage);

  /// Create a copy of MetaCursor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaCursorImplCopyWith<_$MetaCursorImpl> get copyWith =>
      __$$MetaCursorImplCopyWithImpl<_$MetaCursorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaCursorImplToJson(
      this,
    );
  }
}

abstract class _MetaCursor implements MetaCursor {
  const factory _MetaCursor(
          {@JsonKey(name: 'next_cursor') required final String? nextCursor,
          final int? from,
          @JsonKey(name: 'prev_cursor') required final String? prevCursor,
          required final String path,
          @JsonKey(name: 'per_page') required final int perPage}) =
      _$MetaCursorImpl;

  factory _MetaCursor.fromJson(Map<String, dynamic> json) =
      _$MetaCursorImpl.fromJson;

  @override
  @JsonKey(name: 'next_cursor')
  String? get nextCursor;
  @override
  int? get from;
  @override
  @JsonKey(name: 'prev_cursor')
  String? get prevCursor;
  @override
  String get path;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;

  /// Create a copy of MetaCursor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaCursorImplCopyWith<_$MetaCursorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
