import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/interfaces.dart';

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({this.updateParentState, super.key, this.defaultImage});

  ImageProvider? defaultImage;
  File? image;
  VoidCallback? updateParentState;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
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
      child: widget.image == null
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
                      image: FileImage(widget.image!),
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
      widget.image = File(pickImage.path);
      widget.updateParentState!();
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
