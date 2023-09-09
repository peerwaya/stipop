// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_page_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SPPageMap _$SPPageMapFromJson(Map<String, dynamic> json) => SPPageMap(
      pageNumber: json['pageNumber'] as int,
      totalCount: json['totalCount'] as int,
      pageCount: json['pageCount'] as int,
      onePageCountRow: json['onePageCountRow'] as int,
    );

Map<String, dynamic> _$SPPageMapToJson(SPPageMap instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'onePageCountRow': instance.onePageCountRow,
    };
