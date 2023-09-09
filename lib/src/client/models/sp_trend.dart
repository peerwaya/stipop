import 'package:json_annotation/json_annotation.dart';

part 'sp_trend.g.dart';

@JsonSerializable(explicitToJson: true)
class SPTrend {
  final String keyword;

  SPTrend({
    this.keyword = "",
  });

  factory SPTrend.fromJson(Map<String, dynamic> json) =>
      _$SPTrendFromJson(json);

  Map<String, dynamic> toJson() => _$SPTrendToJson(this);
}
