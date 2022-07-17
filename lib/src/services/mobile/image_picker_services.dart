import 'package:image_picker/image_picker.dart';

class ImagePickerServices {
  static Future<XFile?> pickGalleryImage() async {
    //pick image in gallery
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> takeCameraImage() async {
    //take image from camera
    return await ImagePicker().pickImage(source: ImageSource.camera);
  }
}
