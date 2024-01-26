import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';
import '../Providers/user_provider.dart';
import 'profiles_pages_button.dart';

class ProfileWidget extends StatelessWidget {
  final String _mainInfo;
  final String _secondaryInfo;
  final String _buttonLabel;

  const ProfileWidget(this._mainInfo, this._secondaryInfo, this._buttonLabel,
      {super.key});

  @override
  Widget build(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: profilePhoto(getProfilePicture(), 70),
        ),
        _userInformation(),
      ],
    );
  }

  static Widget profilePhoto(ImageProvider image, double size) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: Size.fromRadius(size),
        child: Image(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _userInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: primaryInfoTextWidget(_mainInfo),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: secondaryInfoTextWidget(_secondaryInfo),
        ),
        profilesPageButton(_buttonLabel, () => {}),
      ],
    );
  }

  static Text primaryInfoTextWidget(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        color: fontAppColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text secondaryInfoTextWidget(String text) {
    return Text(text,
        style: const TextStyle(
          color: fontAppColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ));
  }
}
