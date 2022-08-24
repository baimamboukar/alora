import 'dart:convert';

import 'package:grnagain/src/models/prediction.dart';
import 'package:grnagain/src/riverpods/dio_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PredictionsApiServices {
  final Reader _read;
  const PredictionsApiServices(this._read);

  Future<Prediction> runPrediction(XFile image) async {
    try {
      String fileName = image.path.split('/').last;
      FormData imageData = FormData.fromMap({
        "files": await MultipartFile.fromFile(image.path, filename: fileName),
      });
      final response =
          await _read(dioProvider).post('/api/predict', data: imageData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Prediction.fromMap(
            jsonDecode(jsonEncode(response.data[fileName])));
      } else {
        throw Exception('Prediction failed');
      }
    } on DioError catch (err) {
      throw Exception(err);
    }
  }
}
