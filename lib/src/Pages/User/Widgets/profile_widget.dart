import 'package:flutter/material.dart';

import '../../../core/Utils/texts.dart';
import '../../../core/widgets/circular_image.dart';
import 'profiles_pages_button.dart';

class ProfileWidget extends StatelessWidget {
  final String _mainInfo;
  final String _secondaryInfo;
  final String _buttonLabel;
  final Widget page;
  final ImageProvider image;

  const ProfileWidget(this._mainInfo, this._secondaryInfo, this._buttonLabel,
      this.page, this.image,
      {super.key});

  @override
  Widget build(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: 10,
              top: 10),
          child: circularImage(image, 55),
        ),
        _userInformation(context),
      ],
    );
  }

  Widget _userInformation(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          margin: EdgeInsets.zero,
          child: boldAppText(_mainInfo, 30),
        ),
        regularAppText(_secondaryInfo, 16),
        const SizedBox(
          height: 11,
        ),
        profilesPageButton(
            _buttonLabel,
            () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => page,
                ))),
      ],
    );
  }
}
