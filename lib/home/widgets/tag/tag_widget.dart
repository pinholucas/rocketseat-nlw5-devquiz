import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  TagWidget(
      {@required this.title,
      @required this.borderColor,
      @required this.color,
      @required this.textColor});

  final title;
  final borderColor;
  final color;
  final textColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor),
            color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
