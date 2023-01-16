import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/fashion_model.dart';
import '../pages/comment_section.dart';

class CommentIcon extends StatelessWidget {
  final FashionModel fashionModel;

  const CommentIcon({required this.fashionModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showCommentSection(context, fashionModel);
        },
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
              fashionModel.commentCount.toString(),
              style: const TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}
