import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';

final cloudinary = CloudinaryPublic('dcwe0e1am', 'h3wyqbuj', cache: false);

Future<String> uploadImage(File image) async {
  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image));
    return response.secureUrl;
  } on CloudinaryException catch (error) {
    print(error);
  }
  return '';
}
