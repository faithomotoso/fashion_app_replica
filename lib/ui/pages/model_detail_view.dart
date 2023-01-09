import 'dart:ui';

import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:fashion_app_replica/ui/widgets/comment_icon.dart';
import 'package:fashion_app_replica/ui/widgets/like_icon.dart';
import 'package:fashion_app_replica/ui/widgets/minutes_icon.dart';
import 'package:fashion_app_replica/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModelDetailView extends ConsumerStatefulWidget {
  static const String routeName = "/model";

  final FashionModel fashionModel;

  ModelDetailView({required this.fashionModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModelDetailViewState();
}

class _ModelDetailViewState extends ConsumerState<ModelDetailView> {
  late FashionModel fashionModel;
  final TransformationController transformationController =
      TransformationController();

  @override
  void initState() {
    fashionModel = widget.fashionModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Hero(
            tag: fashionModel.id,
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              transformationController: transformationController,
              minScale: 0.01,
              // constrained: false,
              child: Image.asset(
                fashionModel.imagePath,
                fit: BoxFit.cover,
                // fit: BoxFit.cover,
              ),
            ),
          )),
          Positioned.fill(
              child: SafeArea(
                  child: Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.back),
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    CommentIcon(commentCount: fashionModel.commentCount),
                    const SizedBox(
                      height: 20,
                    ),
                    LikeIcon(likeCount: fashionModel.likesCount),
                    const SizedBox(
                      height: 20,
                    ),
                    MinutesIcon(durationInMinutes: fashionModel.minutes),
                  ],
                )
              ],
            ),
          ))),
          Positioned(
            bottom: 35,
            left: 10,
            right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(appBorderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.28),
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.25)),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        fashionModel.name,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            fashionModel.description,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
