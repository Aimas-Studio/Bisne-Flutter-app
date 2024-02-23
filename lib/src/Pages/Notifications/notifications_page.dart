import 'package:flutter/material.dart';

import '../../core/Utils/interfaces.dart';
import '../../core/Utils/texts.dart';
import 'Providers/notifications_provider.dart';
import 'Widgets/notification_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundAppColor,
          title: Center(child: boldAppText('Notificaciones', 25)),
        ),
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: getNotifications(),
                builder: (context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? notificationsList(context, snapshot.data)
                      : loadingNotifications();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
