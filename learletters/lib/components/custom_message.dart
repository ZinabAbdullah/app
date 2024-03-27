import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import '../color.dart';

Widget customMessage(String title) {
  return ClipPath(
    clipper: LowerNipMessageClipper(MessageType.send),
    child: Container(
      height: 88,
      width: 184,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor,
            offset: Offset(0, 7),
            blurRadius: 4,
          )
        ],
        color: lightBlueColor,
        border: Border.all(
          color: blueBorderColor,
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor,
              fontSize: 17,
              shadows: [Shadow(color: blueBorderColor, offset: Offset(-1, 1))]),
        ),
      ),
    ),
  );
}
