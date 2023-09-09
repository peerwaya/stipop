import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stipop/src/client/models/languages.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker.dart';

import '../../flutter_stipop.dart';

//Builder
typedef SPWrapperBuilder = Widget Function(Stream<SPSticker>, SPWrapper);

class SPWrapper extends StatelessWidget {
  final String apikey;
  final SPWrapperBuilder builder;
  final StreamController<SPSticker> streamController =
      new StreamController.broadcast();

  SPWrapper({
    Key? key,
    required this.apikey,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(streamController.stream, this);
  }

  getSticker(String queryText, BuildContext context) async {
    SPSticker? sticker = await SPGet.getSticker(
      queryText: queryText,
      context: context,
      apiKey: apikey, //YOUR API KEY HERE
      lang: SPLanguage.english,
      debounceTimeInMilliseconds: 350,
    );
    if (sticker != null) streamController.add(sticker);
  }
}
