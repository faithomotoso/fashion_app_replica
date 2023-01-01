import 'dart:ui';

import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:fashion_app_replica/utils/colors.dart';
import 'package:fashion_app_replica/utils/utils.dart';
import 'package:flutter/material.dart';

class FashionModelGridItem extends StatelessWidget {
  final FashionModel fashionModel;
  final bool isOutlier;

  const FashionModelGridItem(
      {required this.fashionModel, this.isOutlier = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            // Positioned.fill(
            //     child: ClipRRect(
            //   clipBehavior: Clip.none,
            //   child: ImageFiltered(
            //     imageFilter: ImageFilter.blur(sigmaY: 1000, sigmaX: 100),
            //     child: Image.asset(
            //       fashionModel.imagePath,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // )),
            Material(
              elevation: 20,
              shadowColor: AppColors.purple.withOpacity(0.4),
              borderRadius: BorderRadius.circular(appBorderRadius),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height *
                      (!isOutlier ? 0.3 : 0.2),
                  minHeight: 150,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(fashionModel.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(appBorderRadius),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          fashionModel.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          fashionModel.location,
        )
      ],
    );
  }
}
