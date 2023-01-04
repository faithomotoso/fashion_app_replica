import 'package:fashion_app_replica/core/models/fashion_model.dart';
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
              minScale: 0.5,
              child: Image.asset(
                fashionModel.imagePath,
                // fit: BoxFit.cover,
              ),
            ),
          )),
          Positioned.fill(
              child: SafeArea(
                  child: Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 0),
            child: Column(
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
                )
              ],
            ),
          )))
        ],
      ),
    );
  }
}
