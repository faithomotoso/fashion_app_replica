import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:fashion_app_replica/ui/pages/home.dart';
import 'package:fashion_app_replica/ui/pages/model_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case ModelDetailView.routeName:
        FashionModel fashionModel = settings.arguments as FashionModel;
        return MaterialPageRoute(
            builder: (_) => ModelDetailView(fashionModel: fashionModel));
    }

    return null;
  }
}
