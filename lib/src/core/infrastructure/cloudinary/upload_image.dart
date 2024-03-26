import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:get/get.dart';

final cloudinary = CloudinaryPublic('dcwe0e1am', 'h3wyqbuj', cache: false);

Future<String> uploadImage(File image) async {
  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image));
    Get.showSnackbar(const GetSnackBar(
        message: 'Su tienda ha sido guardada', duration: Duration(seconds: 2)));
    return response.secureUrl;
  } on CloudinaryException catch (error) {
    print('Cloudinary error: ' + error.toString());
  }
  return '';
}
