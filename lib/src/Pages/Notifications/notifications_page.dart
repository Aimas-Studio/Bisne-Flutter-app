import 'package:flutter/material.dart';

import '../../Utils/interfaces.dart';
import '../../Utils/texts.dart';
import '../../Widgets/secondary_app_bar.dart';
import 'Providers/notifications_provider.dart';
import 'Widgets/notification_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: secondaryAppBar(context, true),
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldAppText("Notificaciones", 27),
              FutureBuilder(
                  future: getNotifications(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? notificationsList(context, snapshot.data)
                        : loadingNotifications();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
