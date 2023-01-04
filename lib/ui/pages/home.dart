import 'package:fashion_app_replica/core/providers/fashion_models_provider.dart';
import 'package:fashion_app_replica/ui/widgets/fashion_models_grid.dart';
import 'package:fashion_app_replica/utils/colors.dart';
import 'package:fashion_app_replica/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController categoryTabController;

  @override
  void initState() {
    categoryTabController =
        TabController(length: FashionCategories.values.length, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    categoryTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage("$iconBasePath/menu-bar.png"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage("$iconBasePath/searching.png"),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Fashion Week",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: AppColors.purple, fontWeight: FontWeight.w700),
              ),
              const Text("2021 Fashion show in Paris"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                          AssetImage("$iconBasePath/selective.png")))
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Consumer(builder: (ctx, ref, child) {
                return TabBar(
                  controller: categoryTabController,
                  tabs: List<Widget>.from(
                    FashionCategories.values.map(
                      (e) => Text(
                        e.value,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: (index) {
                    // Update the selected category, the initial should be in sync with the tab controller. Potential bug
                    ref.watch(selectedCategoryProvider.notifier).state =
                        FashionCategories.values.elementAt(index);
                  },
                  labelColor: AppColors.purple,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelPadding: const EdgeInsets.symmetric(vertical: 14)
                      .copyWith(right: 26),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.pressed)
                          ? Colors.transparent
                          : null),
                );
              }),
              const Expanded(child: FashionModelsGrid())
            ],
          ),
        ),
      ),
    );
  }
}
