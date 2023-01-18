import 'dart:math';

import 'package:fashion_app_replica/core/providers/fashion_models_notifier.dart';
import 'package:fashion_app_replica/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/fashion_model.dart';


enum FashionCategories {
  recommended("Recommended"),
  newModels("New Models"),
  show2020("2020 Show");

  const FashionCategories(this.value);

  final String value;
}

final selectedCategoryProvider =
    StateProvider<FashionCategories>((ref) => FashionCategories.recommended);

final fashionModelsProvider = FutureProvider((ref) async {
  final FashionCategories category = ref.watch(selectedCategoryProvider);
  final List<FashionModel> _fashionModels = ref.watch(fashionModelsListProvider);

  await Future.delayed(const Duration(seconds: 1));

  // if (!Random().nextBool()) {
  //   throw Exception("Unable to load");
  // }

  switch (category) {
    case FashionCategories.newModels:
      return List<FashionModel>.from(_fashionModels
          .where((model) => model.category == FashionCategories.newModels));

    case FashionCategories.show2020:
      return List<FashionModel>.from(_fashionModels
          .where((model) => model.category == FashionCategories.show2020));

    default:
      return List<FashionModel>.from(_fashionModels
          .where((model) => model.category == FashionCategories.recommended));
  }
});
