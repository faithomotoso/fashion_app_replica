import 'package:fashion_app_replica/core/providers/fashion_models_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/fashion_model.dart';

class LikeIcon extends ConsumerWidget {
  FashionModel fashionModel;

  LikeIcon({required this.fashionModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    fashionModel = ref
        .watch(fashionModelsListProvider)
        .firstWhere((model) => model == fashionModel);

    return InkWell(
      onTap: () {
        ref
            .read(fashionModelsListProvider.notifier)
            .onLikeAction(fashionModel, !fashionModel.isLikedByUser);
      },
      child: Column(
        children: [
          Icon(
            fashionModel.isLikedByUser
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: Colors.white,
            size: 26.0,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            fashionModel.likesCount.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
