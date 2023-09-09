// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_trending_list_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpTrendingListBody _$SpTrendingListBodyFromJson(Map<String, dynamic> json) =>
    SpTrendingListBody(
      keywordList: (json['keywordList'] as List<dynamic>)
          .map((e) => SPTrend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpTrendingListBodyToJson(SpTrendingListBody instance) =>
    <String, dynamic>{
      'keywordList': instance.keywordList.map((e) => e.toJson()).toList(),
    };
