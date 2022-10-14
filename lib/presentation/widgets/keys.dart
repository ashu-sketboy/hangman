import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Keys extends StatefulWidget {
  Keys({Key? key, required this.keyName, required this.onTap, this.height, this.width})
      : super(key: key);

  final String keyName;
  final double? width, height;
  final Function(String) onTap;

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 22.sp,
      height: widget.height ?? 30.sp,
      child: CustomPaint(
        painter: KeysBox(keyName: widget.keyName, isClicked: isClicked),
        child: InkWell(
          onTap: () {
            if(!isClicked) {
              widget.onTap(widget.keyName);
              setState(() {
                isClicked = true;
              });
            }

          },
        ),
      ),
    );
  }
}

class KeysBox extends CustomPainter {
  final String keyName;
  bool isClicked;

  KeysBox({required this.keyName, this.isClicked = false});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xff051937)
      ..strokeWidth = 2
      ..style = isClicked ? PaintingStyle.fill : PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 5);
    path.lineTo(size.width - size.width / 5, 0);

    path.close();

    canvas.drawPath(path, paint);

    final textPainter = TextPainter(
        text: TextSpan(
            text: keyName,
            style: TextStyle(
              color: const Color(0xff051937),
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout();

// Draw the text centered around the point (50, 100) for instance
    final offset = Offset((size.width / 2) - (textPainter.width / 2),
        (size.height / 2) - (textPainter.height / 2));
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}