import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentIcon extends StatelessWidget {
  final int commentCount;

  CommentIcon({required this.commentCount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.text_bubble,
              color: Colors.white,
              size: 26.0,
            ),
            const SizedBox(height: 4,),
            Text(
              commentCount.toString(),
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}
