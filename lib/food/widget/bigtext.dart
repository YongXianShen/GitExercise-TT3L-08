import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    this.overFlow=TextOverflow.ellipsis,
    this.size=0,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}