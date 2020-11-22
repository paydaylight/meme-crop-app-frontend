import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart';
import 'dart:convert';
import '../models/api_image.dart';
import 'package:http_parser/http_parser.dart';

class ImageApiProvider {
  final Client client = Client();

  Future<ApiImage> postParentImage(image, caption) async {
    final Uri uri = Uri.parse('http://localhost:5000/api/v1/images');

    final request = MultipartRequest('POST', uri)
      ..fields['caption'] = caption
      ..files.add(await MultipartFile.fromPath('image', image.path,
          contentType: MediaType('image', 'png')));

    final StreamedResponse streamedResponse = await request.send();

    return Response.fromStream(streamedResponse).then((response) {
      return _parseImageResponse(response);
    });
  }

  Future<ApiImage> postDerivativeImage(parentId, caption) async {
    final response = await client.post(
        'localhost:5000/api/v1/images/$parentId/derivative?caption=$caption');

    return _parseImageResponse(response);
  }

  Future<ApiImage> postFinalImage(parentId) async {
    final response =
        await client.post('localhost:5000/api/v1/images/$parentId/combo');

    return _parseImageResponse(response);
  }

  ApiImage _parseImageResponse(response) {
    if (response.statusCode == 200) {
      return ApiImage.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post image');
    }
  }
}
