import 'package:flutter/material.dart';

class SPTabTop extends StatefulWidget {
  SPTabTop({Key? key}) : super(key: key);

  @override
  State<SPTabTop> createState() => _GiphyTabTopState();
}

class _GiphyTabTopState extends State<SPTabTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: 50,
      height: 2,
      color: Theme.of(context).textTheme.bodyLarge!.color!,
    );
  }
}
