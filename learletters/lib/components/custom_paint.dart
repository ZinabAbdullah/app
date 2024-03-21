import 'package:flutter/material.dart';

import '../color.dart';

class DrawOnLetter extends StatefulWidget {
  @override
  _DrawOnLetterState createState() => _DrawOnLetterState();
}

class _DrawOnLetterState extends State<DrawOnLetter> {
  List<Offset> _points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        RenderBox object = context.findRenderObject() as RenderBox;
        Offset _localPosition = object.globalToLocal(details.globalPosition);
        setState(() {
          _points.add(_localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(Offset.zero),
      child: CustomPaint(
        painter: LetterPainter(points: _points),
        size: Size.infinite,
      ),
    );
  }
}

class LetterPainter extends CustomPainter {
  final List<Offset> points;

  LetterPainter({required this.points});

  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    // تحديد مسار حرف الألف "أ"
    var path = Path();
    // الجزء العمودي من حرف الألف
    path.moveTo(size.width / 1, size.height / 1);
    path.lineTo(size.width / 1, 2 * size.height / 1);
    // يمكن إضافة المزيد من التفاصيل حسب الحاجة

    canvas.drawPath(path, paint..color = Colors.grey.withOpacity(0.5));

    // رسم نقاط الرسم بواسطة المستخدم
    for (var point in points) {
      if (point != Offset.zero) {
        canvas.drawCircle(point, 22, paint..color = blueColor);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
