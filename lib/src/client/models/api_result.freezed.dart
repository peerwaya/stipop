// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return APIResultSuccess.fromJson(json);
    case 'error':
      return ApiResultError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ApiResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) success,
    required TResult Function(int statusCode, String exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? success,
    TResult? Function(int statusCode, String exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? success,
    TResult Function(int statusCode, String exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APIResultSuccess value) success,
    required TResult Function(ApiResultError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(APIResultSuccess value)? success,
    TResult? Function(ApiResultError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APIResultSuccess value)? success,
    TResult Function(ApiResultError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultCopyWith<$Res> {
  factory $ApiResultCopyWith(ApiResult value, $Res Function(ApiResult) then) =
      _$ApiResultCopyWithImpl<$Res, ApiResult>;
}

/// @nodoc
class _$ApiResultCopyWithImpl<$Res, $Val extends ApiResult>
    implements $ApiResultCopyWith<$Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$APIResultSuccessCopyWith<$Res> {
  factory _$$APIResultSuccessCopyWith(
          _$APIResultSuccess value, $Res Function(_$APIResultSuccess) then) =
      __$$APIResultSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$APIResultSuccessCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$APIResultSuccess>
    implements _$$APIResultSuccessCopyWith<$Res> {
  __$$APIResultSuccessCopyWithImpl(
      _$APIResultSuccess _value, $Res Function(_$APIResultSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$APIResultSuccess(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$APIResultSuccess implements APIResultSuccess {
  const _$APIResultSuccess({required this.data, final String? $type})
      : $type = $type ?? 'success';

  factory _$APIResultSuccess.fromJson(Map<String, dynamic> json) =>
      _$$APIResultSuccessFromJson(json);

  @override
  final String data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIResultSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIResultSuccessCopyWith<_$APIResultSuccess> get copyWith =>
      __$$APIResultSuccessCopyWithImpl<_$APIResultSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) success,
    required TResult Function(int statusCode, String exception) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? success,
    TResult? Function(int statusCode, String exception)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? success,
    TResult Function(int statusCode, String exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APIResultSuccess value) success,
    required TResult Function(ApiResultError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(APIResultSuccess value)? success,
    TResult? Function(ApiResultError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APIResultSuccess value)? success,
    TResult Function(ApiResultError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIResultSuccessToJson(
      this,
    );
  }
}

abstract class APIResultSuccess implements ApiResult {
  const factory APIResultSuccess({required final String data}) =
      _$APIResultSuccess;

  factory APIResultSuccess.fromJson(Map<String, dynamic> json) =
      _$APIResultSuccess.fromJson;

  String get data;
  @JsonKey(ignore: true)
  _$$APIResultSuccessCopyWith<_$APIResultSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResultErrorCopyWith<$Res> {
  factory _$$ApiResultErrorCopyWith(
          _$ApiResultError value, $Res Function(_$ApiResultError) then) =
      __$$ApiResultErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({int statusCode, String exception});
}

/// @nodoc
class __$$ApiResultErrorCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$ApiResultError>
    implements _$$ApiResultErrorCopyWith<$Res> {
  __$$ApiResultErrorCopyWithImpl(
      _$ApiResultError _value, $Res Function(_$ApiResultError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? exception = null,
  }) {
    return _then(_$ApiResultError(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResultError implements ApiResultError {
  const _$ApiResultError(
      {required this.statusCode, required this.exception, final String? $type})
      : $type = $type ?? 'error';

  factory _$ApiResultError.fromJson(Map<String, dynamic> json) =>
      _$$ApiResultErrorFromJson(json);

  @override
  final int statusCode;
  @override
  final String exception;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultError &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultErrorCopyWith<_$ApiResultError> get copyWith =>
      __$$ApiResultErrorCopyWithImpl<_$ApiResultError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) success,
    required TResult Function(int statusCode, String exception) error,
  }) {
    return error(statusCode, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? success,
    TResult? Function(int statusCode, String exception)? error,
  }) {
    return error?.call(statusCode, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? success,
    TResult Function(int statusCode, String exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(statusCode, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APIResultSuccess value) success,
    required TResult Function(ApiResultError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(APIResultSuccess value)? success,
    TResult? Function(ApiResultError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APIResultSuccess value)? success,
    TResult Function(ApiResultError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResultErrorToJson(
      this,
    );
  }
}

abstract class ApiResultError implements ApiResult {
  const factory ApiResultError(
      {required final int statusCode,
      required final String exception}) = _$ApiResultError;

  factory ApiResultError.fromJson(Map<String, dynamic> json) =
      _$ApiResultError.fromJson;

  int get statusCode;
  String get exception;
  @JsonKey(ignore: true)
  _$$ApiResultErrorCopyWith<_$ApiResultError> get copyWith =>
      throw _privateConstructorUsedError;
}
