import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_stipop/src/client/models/sp_trend.dart';

part 'sp_trending_list_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SpTrendingListBody {
  final List<SPTrend> keywordList;

  SpTrendingListBody({
    required this.keywordList,
  });

  factory SpTrendingListBody.fromJson(Map<String, dynamic> json) =>
      _$SpTrendingListBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SpTrendingListBodyToJson(this);
}
