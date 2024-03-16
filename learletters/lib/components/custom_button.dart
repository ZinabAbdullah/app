import 'package:flutter/material.dart';
import '../color.dart';

class CustomButton extends StatelessWidget {
  late WidgetBuilder navigateTo;

  CustomButton({required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: lightBlueColor,
      height: 68.38,
      minWidth: 166.4,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: navigateTo,
        ));
      },
      child: Text(
        "التالي",
        style: TextStyle(color: whiteColor, fontSize: 25),
      ),
    );
  }
}
