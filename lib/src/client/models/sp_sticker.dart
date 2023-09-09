import 'package:json_annotation/json_annotation.dart';

part 'sp_sticker.g.dart';

@JsonSerializable(explicitToJson: true)
class SPSticker {
  final int stickerId;
  final String stickerImg;
  final String keyword;

  SPSticker({
    this.stickerId = -1,
    this.stickerImg = "",
    this.keyword = "",
  });

  factory SPSticker.fromJson(Map<String, dynamic> json) =>
      _$SPStickerFromJson(json);

  Map<String, dynamic> toJson() => _$SPStickerToJson(this);
}
