// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_sticker_list_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpStickerListBody _$SpStickerListBodyFromJson(Map<String, dynamic> json) =>
    SpStickerListBody(
      stickerList: (json['stickerList'] as List<dynamic>?)
          ?.map((e) => SPSticker.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageMap: json['pageMap'] == null
          ? null
          : SPPageMap.fromJson(json['pageMap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpStickerListBodyToJson(SpStickerListBody instance) =>
    <String, dynamic>{
      'stickerList': instance.stickerList?.map((e) => e.toJson()).toList(),
      'pageMap': instance.pageMap?.toJson(),
    };
