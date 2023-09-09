// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SPSearchResponse _$$SPSearchResponseFromJson(Map<String, dynamic> json) =>
    _$SPSearchResponse(
      header: SPResponseHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: SpStickerListBody.fromJson(json['body'] as Map<String, dynamic>),
      $type: json['sp_collection_type'] as String?,
    );

Map<String, dynamic> _$$SPSearchResponseToJson(_$SPSearchResponse instance) =>
    <String, dynamic>{
      'header': instance.header.toJson(),
      'body': instance.body.toJson(),
      'sp_collection_type': instance.$type,
    };

_$SPTrendingSearchTermResponse _$$SPTrendingSearchTermResponseFromJson(
        Map<String, dynamic> json) =>
    _$SPTrendingSearchTermResponse(
      header: SPResponseHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: SpTrendingListBody.fromJson(json['body'] as Map<String, dynamic>),
      $type: json['sp_collection_type'] as String?,
    );

Map<String, dynamic> _$$SPTrendingSearchTermResponseToJson(
        _$SPTrendingSearchTermResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
      'sp_collection_type': instance.$type,
    };
