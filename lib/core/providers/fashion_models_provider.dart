import 'package:fashion_app_replica/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/fashion_model.dart';

// Holds dummy list
List<FashionModel> _fashionModels = [
  FashionModel(
      imagePath: "$imagesBasePath/img1.jpg",
      name: "Niketa William",
      location: "Paris",
      commentCount: 10,
      likesCount: 101,
      minutes: 19,
      category: FashionCategories.recommended),
  FashionModel(
      imagePath: "$imagesBasePath/img2.jpg",
      name: "Trisha Louis",
      location: "London",
      commentCount: 3,
      likesCount: 81,
      minutes: 10,
      category: FashionCategories.recommended),
  FashionModel(
      imagePath: "$imagesBasePath/img5.jpg",
      name: "Milla Jovovich",
      location: "Italy",
      commentCount: 3,
      likesCount: 579,
      minutes: 18,
      category: FashionCategories.recommended),
  FashionModel(
      imagePath: "$imagesBasePath/img4.jpg",
      name: "Anna White",
      location: "Sweden",
      commentCount: 14,
      likesCount: 604,
      minutes: 21,
      category: FashionCategories.newModels),
  FashionModel(
      imagePath: "$imagesBasePath/img3.jpeg",
      name: "Rosa Diaz",
      location: "NY",
      commentCount: 21,
      likesCount: 900,
      minutes: 10,
      category: FashionCategories.newModels),
  FashionModel(
      imagePath: "$imagesBasePath/img6.jpg",
      name: "Mila Murrow",
      location: "Greece",
      commentCount: 3,
      likesCount: 579,
      minutes: 18,
      category: FashionCategories.newModels),
  FashionModel(
      imagePath: "$imagesBasePath/img7.jpg",
      name: "Milla Kunis",
      location: "Paris",
      commentCount: 7,
      likesCount: 387,
      minutes: 22,
      category: FashionCategories.newModels),
  FashionModel(
      imagePath: "$imagesBasePath/img8.jpg",
      name: "The Addams",
      location: "Texas",
      commentCount: 9,
      likesCount: 455,
      minutes: 18,
      category: FashionCategories.show2020),
  FashionModel(
      imagePath: "$imagesBasePath/img9.jpg",
      name: "Diego Sanchez",
      location: "New Mexico",
      commentCount: 29,
      likesCount: 873,
      minutes: 10,
      category: FashionCategories.show2020),
  FashionModel(
      imagePath: "$imagesBasePath/img10.jpg",
      name: "Andrew Snowden",
      location: "Russia",
      commentCount: 3,
      likesCount: 579,
      minutes: 18,
      category: FashionCategories.show2020),
];

enum FashionCategories {
  recommended("Recommended"),
  newModels("New Models"),
  show2020("2020 Show");

  const FashionCategories(this.value);

  final String value;
}

final selectedCategoryProvider =
    StateProvider<FashionCategories>((ref) => FashionCategories.recommended);

final fashionModels = FutureProvider((ref) async {
  final FashionCategories category = ref.watch(selectedCategoryProvider);

  await Future.delayed(const Duration(seconds: 3));

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
