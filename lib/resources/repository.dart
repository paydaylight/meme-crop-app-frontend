import 'dart:async';
import './image_api_provider.dart';
import '../models/api_image.dart';

class Repository {
  final imageApiProvider = ImageApiProvider();

  Future<ApiImage> postImage(image, caption) =>
      imageApiProvider.postParentImage(image, caption);

  Future<ApiImage> postDerivative(parentId, caption) =>
      imageApiProvider.postDerivativeImage(parentId, caption);

  Future<ApiImage> postFinal(parentId) =>
      imageApiProvider.postFinalImage(parentId);
}
