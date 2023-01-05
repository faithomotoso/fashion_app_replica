import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinutesIcon extends StatelessWidget {
  final int durationInMinutes;

  MinutesIcon({required this.durationInMinutes});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          CupertinoIcons.time,
          color: Colors.white,
          size: 26.0,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          durationInMinutes.toString(),
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
