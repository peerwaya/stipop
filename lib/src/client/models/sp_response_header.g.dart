// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_response_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SPResponseHeader _$SPResponseHeaderFromJson(Map<String, dynamic> json) =>
    SPResponseHeader(
      code: json['code'] as String,
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SPResponseHeaderToJson(SPResponseHeader instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
    };
