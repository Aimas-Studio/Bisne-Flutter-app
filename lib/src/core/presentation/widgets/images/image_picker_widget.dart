import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../themes/colors.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({this.onTap, super.key, this.defaultImage});
  final ImageProvider? defaultImage;
  final VoidCallback? onTap;

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
          ? imageHolder()
          : ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: SizedBox.expand(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: bisneColorPrimary,
                  ),
                ),
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

  Widget imageHolder() {
    return widget.defaultImage == null
        ? const Center(
            child: Icon(
              Icons.add_photo_alternate_outlined,
              color: fontAppColor,
            ),
          )
        : ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            child: SizedBox.expand(
              child: Container(
                padding: const EdgeInsets.only(left: 5, top: 5),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.defaultImage!,
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Icon(
                  Icons.edit,
                  color: bisneColorPrimary,
                ),
              ),
            ),
          );
  }
}
