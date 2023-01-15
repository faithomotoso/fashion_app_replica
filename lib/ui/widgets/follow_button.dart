import 'package:fashion_app_replica/utils/colors.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FollowButtonShape(),
      child: SizedBox(
        width: 130,
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Follow",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(width: 8,),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(6),
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FollowButtonShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.red;

    Path path = Path();
    path.moveTo(0, size.height);

    path.lineTo(0.0, size.height * 0.5);
    path.arcToPoint(
      Offset(size.width * 0.2, 0),
      radius: const Radius.circular(30),
    );

    path.lineTo(size.width * 0.8, 0);
    path.arcToPoint(Offset(size.width * 0.8, size.height),
        radius: const Radius.circular(10));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
