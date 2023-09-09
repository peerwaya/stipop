// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SPSticker _$SPStickerFromJson(Map<String, dynamic> json) => SPSticker(
      stickerId: json['stickerId'] as int? ?? -1,
      stickerImg: json['stickerImg'] as String? ?? "",
      keyword: json['keyword'] as String? ?? "",
    );

Map<String, dynamic> _$SPStickerToJson(SPSticker instance) => <String, dynamic>{
      'stickerId': instance.stickerId,
      'stickerImg': instance.stickerImg,
      'keyword': instance.keyword,
    };
