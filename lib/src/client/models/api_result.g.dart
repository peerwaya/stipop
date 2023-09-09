// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$APIResultSuccess _$$APIResultSuccessFromJson(Map<String, dynamic> json) =>
    _$APIResultSuccess(
      data: json['data'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$APIResultSuccessToJson(_$APIResultSuccess instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };

_$ApiResultError _$$ApiResultErrorFromJson(Map<String, dynamic> json) =>
    _$ApiResultError(
      statusCode: json['statusCode'] as int,
      exception: json['exception'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ApiResultErrorToJson(_$ApiResultError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'exception': instance.exception,
      'runtimeType': instance.$type,
    };
