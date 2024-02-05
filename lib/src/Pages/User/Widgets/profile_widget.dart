import 'package:bisne/src/Pages/User/edit_user_page.dart';
import 'package:flutter/material.dart';

import '../../../Utils/texts.dart';
import '../Providers/user_providers.dart';
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
          child: profilePhoto(getProfilePicture(), 75),
        ),
        _userInformation(context),
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

  Widget _userInformation(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 17, bottom: 0),
          margin: EdgeInsets.zero,
          child: boldAppText(_mainInfo, 30),
        ),
        Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: regularAppText(_secondaryInfo, 16)),
        profilesPageButton(
            _buttonLabel,
            () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const EditUserPage(),
                ))),
      ],
    );
  }
}
