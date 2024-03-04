import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../infrastructure/services/notifications_services.dart';
import '../widgets/notification_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundAppColor,
          title: const Center(
              child: BoldAppText(text: 'Notificaciones', size: 25)),
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
