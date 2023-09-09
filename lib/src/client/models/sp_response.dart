// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_stipop/src/client/models/sp_page_map.dart';
import 'package:flutter_stipop/src/client/models/sp_response_header.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker_list_body.dart';
import 'package:flutter_stipop/src/client/models/sp_trending_list_body.dart';

part 'sp_response.g.dart';
part 'sp_response.freezed.dart';

enum SpCollectionType {
  search,
  trending,
}

@Freezed(unionKey: 'sp_collection_type', unionValueCase: FreezedUnionCase.snake)
class SPResponse with _$SPResponse {
  @JsonSerializable(explicitToJson: true)
  const factory SPResponse.search({
    required SPResponseHeader header,
    required SpStickerListBody body,
  }) = SPSearchResponse;

  const factory SPResponse.trending({
    required SPResponseHeader header,
    required SpTrendingListBody body,
  }) = SPTrendingSearchTermResponse;

  factory SPResponse.fromJson(Map<String, dynamic> json) =>
      _$SPResponseFromJson(json);

  @override
  String toString() {
    return '${toJson()}';
  }
}
