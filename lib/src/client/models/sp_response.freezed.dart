// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SPResponse _$SPResponseFromJson(Map<String, dynamic> json) {
  switch (json['sp_collection_type']) {
    case 'search':
      return SPSearchResponse.fromJson(json);
    case 'trending':
      return SPTrendingSearchTermResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'sp_collection_type', 'SPResponse',
          'Invalid union type "${json['sp_collection_type']}"!');
  }
}

/// @nodoc
mixin _$SPResponse {
  SPResponseHeader get header => throw _privateConstructorUsedError;
  Object get body => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SPResponseHeader header, SpStickerListBody body)
        search,
    required TResult Function(SPResponseHeader header, SpTrendingListBody body)
        trending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SPResponseHeader header, SpStickerListBody body)? search,
    TResult? Function(SPResponseHeader header, SpTrendingListBody body)?
        trending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SPResponseHeader header, SpStickerListBody body)? search,
    TResult Function(SPResponseHeader header, SpTrendingListBody body)?
        trending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SPSearchResponse value) search,
    required TResult Function(SPTrendingSearchTermResponse value) trending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SPSearchResponse value)? search,
    TResult? Function(SPTrendingSearchTermResponse value)? trending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SPSearchResponse value)? search,
    TResult Function(SPTrendingSearchTermResponse value)? trending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SPResponseCopyWith<SPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SPResponseCopyWith<$Res> {
  factory $SPResponseCopyWith(
          SPResponse value, $Res Function(SPResponse) then) =
      _$SPResponseCopyWithImpl<$Res, SPResponse>;
  @useResult
  $Res call({SPResponseHeader header});
}

/// @nodoc
class _$SPResponseCopyWithImpl<$Res, $Val extends SPResponse>
    implements $SPResponseCopyWith<$Res> {
  _$SPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as SPResponseHeader,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SPSearchResponseCopyWith<$Res>
    implements $SPResponseCopyWith<$Res> {
  factory _$$SPSearchResponseCopyWith(
          _$SPSearchResponse value, $Res Function(_$SPSearchResponse) then) =
      __$$SPSearchResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SPResponseHeader header, SpStickerListBody body});
}

/// @nodoc
class __$$SPSearchResponseCopyWithImpl<$Res>
    extends _$SPResponseCopyWithImpl<$Res, _$SPSearchResponse>
    implements _$$SPSearchResponseCopyWith<$Res> {
  __$$SPSearchResponseCopyWithImpl(
      _$SPSearchResponse _value, $Res Function(_$SPSearchResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? body = null,
  }) {
    return _then(_$SPSearchResponse(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as SPResponseHeader,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as SpStickerListBody,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SPSearchResponse implements SPSearchResponse {
  const _$SPSearchResponse(
      {required this.header, required this.body, final String? $type})
      : $type = $type ?? 'search';

  factory _$SPSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$$SPSearchResponseFromJson(json);

  @override
  final SPResponseHeader header;
  @override
  final SpStickerListBody body;

  @JsonKey(name: 'sp_collection_type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SPSearchResponse &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SPSearchResponseCopyWith<_$SPSearchResponse> get copyWith =>
      __$$SPSearchResponseCopyWithImpl<_$SPSearchResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SPResponseHeader header, SpStickerListBody body)
        search,
    required TResult Function(SPResponseHeader header, SpTrendingListBody body)
        trending,
  }) {
    return search(header, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SPResponseHeader header, SpStickerListBody body)? search,
    TResult? Function(SPResponseHeader header, SpTrendingListBody body)?
        trending,
  }) {
    return search?.call(header, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SPResponseHeader header, SpStickerListBody body)? search,
    TResult Function(SPResponseHeader header, SpTrendingListBody body)?
        trending,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(header, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SPSearchResponse value) search,
    required TResult Function(SPTrendingSearchTermResponse value) trending,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SPSearchResponse value)? search,
    TResult? Function(SPTrendingSearchTermResponse value)? trending,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SPSearchResponse value)? search,
    TResult Function(SPTrendingSearchTermResponse value)? trending,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SPSearchResponseToJson(
      this,
    );
  }
}

abstract class SPSearchResponse implements SPResponse {
  const factory SPSearchResponse(
      {required final SPResponseHeader header,
      required final SpStickerListBody body}) = _$SPSearchResponse;

  factory SPSearchResponse.fromJson(Map<String, dynamic> json) =
      _$SPSearchResponse.fromJson;

  @override
  SPResponseHeader get header;
  @override
  SpStickerListBody get body;
  @override
  @JsonKey(ignore: true)
  _$$SPSearchResponseCopyWith<_$SPSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SPTrendingSearchTermResponseCopyWith<$Res>
    implements $SPResponseCopyWith<$Res> {
  factory _$$SPTrendingSearchTermResponseCopyWith(
          _$SPTrendingSearchTermResponse value,
          $Res Function(_$SPTrendingSearchTermResponse) then) =
      __$$SPTrendingSearchTermResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SPResponseHeader header, SpTrendingListBody body});
}

/// @nodoc
class __$$SPTrendingSearchTermResponseCopyWithImpl<$Res>
    extends _$SPResponseCopyWithImpl<$Res, _$SPTrendingSearchTermResponse>
    implements _$$SPTrendingSearchTermResponseCopyWith<$Res> {
  __$$SPTrendingSearchTermResponseCopyWithImpl(
      _$SPTrendingSearchTermResponse _value,
      $Res Function(_$SPTrendingSearchTermResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? body = null,
  }) {
    return _then(_$SPTrendingSearchTermResponse(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as SPResponseHeader,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as SpTrendingListBody,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SPTrendingSearchTermResponse implements SPTrendingSearchTermResponse {
  const _$SPTrendingSearchTermResponse(
      {required this.header, required this.body, final String? $type})
      : $type = $type ?? 'trending';

  factory _$SPTrendingSearchTermResponse.fromJson(Map<String, dynamic> json) =>
      _$$SPTrendingSearchTermResponseFromJson(json);

  @override
  final SPResponseHeader header;
  @override
  final SpTrendingListBody body;

  @JsonKey(name: 'sp_collection_type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SPTrendingSearchTermResponse &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SPTrendingSearchTermResponseCopyWith<_$SPTrendingSearchTermResponse>
      get copyWith => __$$SPTrendingSearchTermResponseCopyWithImpl<
          _$SPTrendingSearchTermResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SPResponseHeader header, SpStickerListBody body)
        search,
    required TResult Function(SPResponseHeader header, SpTrendingListBody body)
        trending,
  }) {
    return trending(header, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SPResponseHeader header, SpStickerListBody body)? search,
    TResult? Function(SPResponseHeader header, SpTrendingListBody body)?
        trending,
  }) {
    return trending?.call(header, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SPResponseHeader header, SpStickerListBody body)? search,
    TResult Function(SPResponseHeader header, SpTrendingListBody body)?
        trending,
    required TResult orElse(),
  }) {
    if (trending != null) {
      return trending(header, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SPSearchResponse value) search,
    required TResult Function(SPTrendingSearchTermResponse value) trending,
  }) {
    return trending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SPSearchResponse value)? search,
    TResult? Function(SPTrendingSearchTermResponse value)? trending,
  }) {
    return trending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SPSearchResponse value)? search,
    TResult Function(SPTrendingSearchTermResponse value)? trending,
    required TResult orElse(),
  }) {
    if (trending != null) {
      return trending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SPTrendingSearchTermResponseToJson(
      this,
    );
  }
}

abstract class SPTrendingSearchTermResponse implements SPResponse {
  const factory SPTrendingSearchTermResponse(
      {required final SPResponseHeader header,
      required final SpTrendingListBody body}) = _$SPTrendingSearchTermResponse;

  factory SPTrendingSearchTermResponse.fromJson(Map<String, dynamic> json) =
      _$SPTrendingSearchTermResponse.fromJson;

  @override
  SPResponseHeader get header;
  @override
  SpTrendingListBody get body;
  @override
  @JsonKey(ignore: true)
  _$$SPTrendingSearchTermResponseCopyWith<_$SPTrendingSearchTermResponse>
      get copyWith => throw _privateConstructorUsedError;
}
