import 'package:flutter/foundation.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/api_image.dart';

class ImagesBloc {
  final _repository = Repository();
  final _imagesFetcher = PublishSubject<ApiImage>();

  Stream<ApiImage> get postImage => _imagesFetcher.stream;

  postApiImage(image, caption) async {
    ApiImage apiImage = await _repository.postImage(image, caption);
    _imagesFetcher.sink.add(apiImage);
  }

  postApiDerivativeImage(parentId, caption) async {
    ApiImage apiImage = await _repository.postDerivative(parentId, caption);
    _imagesFetcher.sink.add(apiImage);
  }

  postApiFinalImage(parentId) async {
    ApiImage apiImage = await _repository.postFinal(parentId);
    _imagesFetcher.sink.add(apiImage);
  }

  dispose() {
    _imagesFetcher.close();
  }
}
