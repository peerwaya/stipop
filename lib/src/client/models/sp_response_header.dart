import 'package:json_annotation/json_annotation.dart';

part 'sp_response_header.g.dart';

@JsonSerializable(explicitToJson: true)
class SPResponseHeader {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'message')
  final String message;

  SPResponseHeader({
    required this.code,
    required this.status,
    required this.message,
  });

  factory SPResponseHeader.fromJson(Map<String, dynamic> json) =>
      _$SPResponseHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$SPResponseHeaderToJson(this);
}
