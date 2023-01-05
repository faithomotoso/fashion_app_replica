import 'package:flutter/material.dart';

class LikeIcon extends StatelessWidget {
  final int likeCount;

  LikeIcon({required this.likeCount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          const Icon(
            Icons.favorite_border_rounded,
            color: Colors.white,
            size: 26.0,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            likeCount.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
