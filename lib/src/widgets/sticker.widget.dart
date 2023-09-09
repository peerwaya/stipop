import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker.dart';

class SPStickerWidget extends StatelessWidget {
  final SPSticker sticker;
  final BorderRadius? borderRadius;
  const SPStickerWidget({
    Key? key,
    required this.sticker,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: ExtendedImage.network(
        sticker.stickerImg,
      ),
    );
  }
}
