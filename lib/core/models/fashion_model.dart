// Handle name, image etc of a fashion model

import 'package:fashion_app_replica/core/providers/fashion_models_provider.dart';
import 'package:flutter/foundation.dart';

class FashionModel {
  late final String _id;
  late final String _imagePath;
  late final String _name;
  late final String _location;
  late final int _commentCount;
  late final int _likesCount;
  late final int _minutes;
  late final String _description;
  late final FashionCategories _category;

  String get id => _id;

  String get imagePath => _imagePath;

  String get name => _name;

  String get location => _location;

  int get commentCount => _commentCount;

  int get likesCount => _likesCount;

  int get minutes => _minutes;

  String get description => _description;

  FashionCategories get category => _category;

  FashionModel({
    required String imagePath,
    required String name,
    required String location,
    required int commentCount,
    required int likesCount,
    required int minutes,
    required FashionCategories category,
    required String description,
  }) {
    this._id = UniqueKey().toString();
    this._imagePath = imagePath;
    this._name = name;
    this._location = location;
    this._commentCount = commentCount;
    this._likesCount = likesCount;
    this._minutes = minutes;
    this._category = category;
    this._description = description;
  }

  @override
  bool operator ==(Object other) {
    return other is FashionModel && other.id == this.id;
  }

  @override
  int get hashCode {
    return Object.hashAll([id]);
  }
}
