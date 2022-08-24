import 'package:grnagain/src/models/prediction.dart';
import 'package:grnagain/src/services/api/prediction_api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final predictionsServicesRiverpod = Provider<PredictionsApiServices>((ref) {
  return PredictionsApiServices(ref.read);
});

final predicterRiverpod =
    FutureProvider.family<Prediction, XFile>((ref, file) async {
  return await ref.read(predictionsServicesRiverpod).runPrediction(file);
});
