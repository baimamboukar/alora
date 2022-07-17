import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PredictionsServices {
  final WidgetRef ref;
  const PredictionsServices(this.ref);

  // run tensorflow lite prediction on image
  Future<String> runPredictions(XFile image) async {
    // predict image
    EasyLoading.showProgress(12.0, status: "Predicting...");
    return 'predicting';
  }
}
