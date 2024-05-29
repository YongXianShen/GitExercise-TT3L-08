import 'package:flutter/material.dart';

import 'package:mmusuperapp/food/widget/smalltext.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  
  final Color iconColor;

  const IconAndTextWidget({
    super.key,
    
    required this.icon,
    required this.iconColor,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size:24,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}