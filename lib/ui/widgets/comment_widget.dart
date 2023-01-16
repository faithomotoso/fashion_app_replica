import 'package:fashion_app_replica/core/models/comment.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({required this.comment, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          child: Icon(Icons.person_outline),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(child: Text(comment.body))
      ],
    );
  }
}
