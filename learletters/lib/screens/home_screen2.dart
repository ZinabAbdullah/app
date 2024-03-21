import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import '../components/custom_paint.dart';
import '../components/custom_paint.dart';
import 'home_screen3.dart';

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({Key? key}) : super(key: key);

  @override
  _SecondHomeScreenState createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  bool isTouching = false;

  get points => null;
  // ui.Image image;
  // List<Offset> points = <Offset>[];
  // bool isMatched = false;

  // @override
  // void initState() {
  //   super.initState();
  //   loadImage();
  // }
  //
  // void loadImage() async {
  //   final ByteData data = await rootBundle.load('assets/images/letter1.jpg');
  //   final Uint8List bytes = data.buffer.asUint8List();
  //   image = await decodeImageFromList(bytes);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 30,
              vertical: MediaQuery.of(context).size.height / 30,
            ),
            child: Center(
                child: Column(children: [
              CustomHeader(
                navigateTo: (context) => const ThirdHomeScreen(),
              ),
              const SizedBox(
                height: 70,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                      height: 278.43,
                      child: Image.asset("assets/images/letter1.png")),
                  SizedBox(height: 200, width: 20, child: DrawOnLetter()),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              CustomButton(
                navigateTo: (context) => const ThirdHomeScreen(),
                backgroundColor: lightBlueColor,
                textBorderColor: lightBlackBorderColor,
                title: 'التالي',
              ),
            ])),
          ),
        ),
      ),
    );
  }
}

// class ImagePainter extends CustomPainter {
//   List<Offset> points;
//
//   ImagePainter(this.points);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue.withOpacity(0.5)
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 10.0;
//
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i], points[i + 1], paint);
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
