import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fashion_app_replica/core/models/comment.dart';
import 'package:fashion_app_replica/core/models/fashion_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentsRepository =
    FutureProvider.autoDispose.family<List<Comment>, int>((ref, limit) async {
  return await CommentsRepository().getComments(limit: limit);
});

class CommentsRepository {
  final Dio _dio = Dio();

  Future<List<Comment>> getComments({required int limit}) async {
    Response response = await _dio.get("https://dummyjson.com/comments",
        queryParameters: {"limit": limit != 0 ? limit : 10});

    return List<Comment>.from(
        response.data["comments"].map((c) => Comment.fromJson(json: c)));
  }
}
