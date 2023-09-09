import 'package:json_annotation/json_annotation.dart';

part 'sp_page_map.g.dart';

@JsonSerializable(explicitToJson: true)
class SPPageMap {
  final int pageNumber;
  final int totalCount;
  final int pageCount;
  final int onePageCountRow;

  SPPageMap(
      {required this.pageNumber,
      required this.totalCount,
      required this.pageCount,
      required this.onePageCountRow});

  factory SPPageMap.fromJson(Map<String, dynamic> json) =>
      _$SPPageMapFromJson(json);

  Map<String, dynamic> toJson() => _$SPPageMapToJson(this);
}
