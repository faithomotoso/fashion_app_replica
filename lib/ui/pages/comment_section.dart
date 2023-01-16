import 'dart:developer';

import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:fashion_app_replica/core/repository/comments_repository.dart';
import 'package:fashion_app_replica/ui/widgets/comment_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showCommentSection(BuildContext context, FashionModel fashionModel) {
  showCupertinoModalPopup(
      context: context,
      builder: (ctx) => LayoutBuilder(builder: (ctx, constraints) {
            return SizedBox(
                height: constraints.maxHeight * 0.8,
                child: CommentSection(
                  fashionModel: fashionModel,
                ));
          }));
}

class CommentSection extends StatefulWidget {
  final FashionModel fashionModel;

  const CommentSection({required this.fashionModel, Key? key})
      : super(key: key);

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comments",
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(),
            Expanded(
              child: Consumer(
                builder: (ctx, ref, child) {
                  return ref
                      .watch(
                          commentsRepository(widget.fashionModel.commentCount))
                      .when(
                          data: (data) {
                            if (data.isEmpty) {
                              return const Center(
                                child: Text("No comments"),
                              );
                            }

                            return ListView.separated(
                              itemCount: data.length,
                              separatorBuilder: (ctx, index) => const SizedBox(
                                height: 20,
                              ),
                              itemBuilder: (ctx, index) =>
                                  CommentWidget(comment: data.elementAt(index)),
                            );
                          },
                          error: (error, stack) {
                            log("Error loading comments: $error -> $stack");
                            return const Center(
                              child: Text("Unable to load comments"),
                            );
                          },
                          loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
