import 'dart:math';

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
      category: FashionCategories.recommended,
      description:
          "Niketa is a bubbly, playful young woman with a bright smile and a love of bold patterns and colors. "
          "She exudes a sense of fun and joy in her fashion choices, often pairing playful skirts with elegant, sophisticated pieces for a unique and striking look on the catwalk."),
  FashionModel(
      imagePath: "$imagesBasePath/img2.jpg",
      name: "Trisha Louis",
      location: "London",
      commentCount: 3,
      likesCount: 81,
      minutes: 10,
      category: FashionCategories.recommended,
      description:
          "Trisha is a striking redhead with piercing green eyes and a killer body."
          " She's known for her bold fashion choices and killer confidence on the runway, often incorporating edgy and avant-garde looks into her outfits."),
  FashionModel(
      imagePath: "$imagesBasePath/img5.jpg",
      name: "Milla Jovovich",
      location: "Italy",
      commentCount: 3,
      likesCount: 579,
      minutes: 18,
      category: FashionCategories.recommended,
      description:
          "Milla is a mysterious woman with dark, smoldering eyes and long, sleek black hair."
          " She exudes an air of sophistication and confidence on the catwalk, often wearing elegant evening gowns and chic power suits."),
  FashionModel(
      imagePath: "$imagesBasePath/img4.jpg",
      name: "Anna White",
      location: "Sweden",
      commentCount: 14,
      likesCount: 604,
      minutes: 21,
      category: FashionCategories.newModels,
      description:
          "Anna is a bubbly, vivacious young woman with a bright smile and infectious energy."
          " She loves to have fun with her fashion choices, often incorporating bright colors and bold patterns into her outfits."),
  FashionModel(
      imagePath: "$imagesBasePath/img3.jpeg",
      name: "Rosa Diaz",
      location: "NY",
      commentCount: 21,
      likesCount: 900,
      minutes: 10,
      category: FashionCategories.newModels,
      description:
          "Rosa is a tall and slender brunette with piercing green eyes and a sharp, angular jawline."
          " She has a classic, elegant beauty that shines through in her chic, tailored looks on the runway."),
  FashionModel(
      imagePath: "$imagesBasePath/img6.jpg",
      name: "Mila Murrow",
      location: "Greece",
      commentCount: 3,
      likesCount: 579,
      minutes: 18,
      category: FashionCategories.newModels,
      description:
          "Mila is a confident woman with a fierce attitude and bold style. "
          "She's known for her fierce strut and love of vibrant colors and bold patterns, often breaking traditional fashion rules in her outfits."),
  FashionModel(
      imagePath: "$imagesBasePath/img7.jpg",
      name: "Milla Kunis",
      location: "Paris",
      commentCount: 7,
      likesCount: 387,
      minutes: 22,
      category: FashionCategories.newModels,
      description:
          "Milla Kunis is a petite and delicate beauty with porcelain skin and flowing locks. "
          "She excels in ethereal, romantic looks and has a graceful, balletic walk that turns heads on the catwalk."),
  FashionModel(
      imagePath: "$imagesBasePath/img8.jpg",
      name: "The Addams",
      location: "Texas",
      commentCount: 9,
      likesCount: 455,
      minutes: 18,
      category: FashionCategories.show2020,
      description:
          "Tyler and Madison Addams are a couple known for their high fashion looks and steamy chemistry on the runway. "
          "Tyler is tall and muscular with a rugged, masculine energy, while Madison is stunning with piercing brown eyes and a killer figure. "
          "Together, they set the stage on fire with their smoldering looks and dynamic presence"),
  FashionModel(
      imagePath: "$imagesBasePath/img9.jpg",
      name: "Diego Sanchez",
      location: "New Mexico",
      commentCount: 29,
      likesCount: 873,
      minutes: 10,
      category: FashionCategories.show2020,
      description:
          "Diego Sanchez is a charming, handsome young man with a model-perfect physique. "
          "His signature look is edgy and cool, often pairing leather jackets with ripped jeans and statement sneakers."),
  FashionModel(
      imagePath: "$imagesBasePath/img10.jpg",
      name: "Andrew Snowden",
      location: "Russia",
      commentCount: 3,
      likesCount: 579,
      minutes: 18,
      category: FashionCategories.show2020,
      description:
          "Andrew Snowden is a towering 6'3\" with piercing blue eyes and chiseled jawline. "
          "He exudes confidence on the runway, often stealing the show in tailored suits and designer denim"),
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

final fashionModelsProvider = FutureProvider((ref) async {
  final FashionCategories category = ref.watch(selectedCategoryProvider);

  await Future.delayed(const Duration(seconds: 1));

  if (!Random().nextBool()) {
    throw Exception("Unable to load");
  }

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
