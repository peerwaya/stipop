// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_stipop/src/client/models/sp_response.dart';

part 'api_result.g.dart';
part 'api_result.freezed.dart';

@freezed
class ApiResult with _$ApiResult {
  @JsonSerializable(explicitToJson: true)
  const factory ApiResult.success({
    required String data,
  }) = APIResultSuccess;

  const factory ApiResult.error({
    required int statusCode,
    required String exception,
  }) = ApiResultError;

  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  @override
  String toString() {
    return '${toJson()}';
  }
}
