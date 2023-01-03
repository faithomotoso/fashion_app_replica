import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:fashion_app_replica/core/providers/fashion_models_provider.dart';
import 'package:fashion_app_replica/ui/widgets/fashion_model_grid_item.dart';
import 'package:fashion_app_replica/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FashionModelsGrid extends ConsumerWidget {
  const FashionModelsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fashionModelsProvider).when(
        data: (models) {
          List<FashionModel> modelsForGrid = models;

          FashionModel? outlier;

          if (models.length.isOdd) {
            outlier = modelsForGrid.removeLast();
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.53,
                  crossAxisSpacing: 20,
                  shrinkWrap: true,
                  primary: false,
                  children: List<Widget>.from(
                      models.map((e) => FashionModelGridItem(fashionModel: e))),
                ),
                if (outlier != null) ...[
                  FashionModelGridItem(
                    fashionModel: outlier,
                    isOutlier: true,
                  )
                ],
              ],
            ),
          );
        },
        error: (err, stack) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Failed to load"),
                  ElevatedButton(
                      onPressed: () {
                        // invalidate / refresh would reload the future if there's an error
                        // but would not show the loading indicator again, which isn't so good imo
                        // ref.invalidate(fashionModelsProvider);
                        ref.refresh(fashionModelsProvider);
                      },
                      child: const Text("Retry"))
                ],
              ),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            ));
  }
}
