import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
          child: CustomPaint(painter: MyPainter()),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.orange;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6;
    canvas.drawCircle(Offset(size.width/2, size.height/2), 30, paint);
    canvas.drawRect(const Offset(3, 3) & Size(size.height/2, size.width/2), paint);
    canvas.drawLine(Offset.zero, Offset(size.height/2, size.width/2), paint);
  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}