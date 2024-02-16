import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/interfaces.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? image;
  @override
  Widget build(context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        elevation: MaterialStatePropertyAll(0),
        side: MaterialStatePropertyAll(
          BorderSide(
            width: 0.5,
            color: borderColor,
          ),
        ),
        fixedSize: MaterialStatePropertyAll(Size.square(80)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      onPressed: () => getImage(),
      child: image == null
          ? addImageHolder()
          : Container(
              decoration: ShapeDecoration(
                image: DecorationImage(
                    image: FileImage(image!), fit: BoxFit.cover),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              child: const SizedBox.expand(
                child: null,
              ),
            ),
    );
  }
  //TODO refactor this code

  Future getImage() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage == null) return;

    setState(() {
      image = File(pickImage.path);
    });
  }

  Widget addImageHolder() {
    return const Center(
      child: Icon(
        Icons.add_photo_alternate_outlined,
        color: fontAppColor,
      ),
    );
  }
}
