import 'package:flutter_stipop/src/client/models/sp_page_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker.dart';

part 'sp_sticker_list_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SpStickerListBody {
  final List<SPSticker>? stickerList;
  final SPPageMap? pageMap;

  SpStickerListBody({
    this.stickerList,
    this.pageMap,
  });

  factory SpStickerListBody.fromJson(Map<String, dynamic> json) =>
      _$SpStickerListBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SpStickerListBodyToJson(this);
}
