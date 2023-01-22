import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:fashion_app_replica/core/providers/fashion_models_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FashionModelPictureViewer extends ConsumerStatefulWidget {
  final FashionModel fashionModel;

  FashionModelPictureViewer({required this.fashionModel});

  @override
  ConsumerState<FashionModelPictureViewer> createState() =>
      _FashionModelPictureViewerState();
}

class _FashionModelPictureViewerState
    extends ConsumerState<FashionModelPictureViewer> {
  late final FashionModel fashionModel;
  final TransformationController transformationController =
      TransformationController();
  final ValueNotifier<bool> showLikeIcon = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    fashionModel = widget.fashionModel;
  }

  @override
  void dispose() {
    transformationController.dispose();
    showLikeIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        ref
            .read(fashionModelsListProvider.notifier)
            .onLikeAction(fashionModel, true);
        triggerLikeIcon();
      },
      child: Stack(
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
          Center(
            child: ValueListenableBuilder<bool>(
              valueListenable: showLikeIcon,
              builder: (context, show, child) {
                return AnimatedOpacity(
                  opacity: show ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 160,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void triggerLikeIcon() async {
    if (!showLikeIcon.value) {
      showLikeIcon.value = true;
      await Future.delayed(const Duration(milliseconds: 600));
      showLikeIcon.value = false;
    }
  }
}
