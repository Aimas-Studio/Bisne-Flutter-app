import 'package:bisne/src/models/notifications/presentation/widgets/notification_widget.dart';
import 'package:bisne/src/models/shop/export.dart';
import 'package:bisne/src/models/shop/presentation/widgets/shop_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../cart/export.dart';
import '../../../notifications/export.dart';

class ShopMoreInfoPage extends StatelessWidget {
  final Shop shop;
  const ShopMoreInfoPage({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(shop: shop),
      body: DetailInfo(shop: shop),
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    );
  }
}

class ShopAppBar extends AppBar {
  ShopAppBar({
    super.key,
    required this.shop,
  });

  final Shop shop;

  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70,
        leading: const ReturnButtonAppbar(),
        title: Row(
          children: [
            CircularImage(
                size: 25,
                shadow: false,
                child: Image(image: NetworkImage(shop.imageUrl))),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: RegularAppText(
                      text: shop.name,
                      size: 20,
                      color: fontAppColor,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: RegularAppText(
                      text: shop.category,
                      size: 18,
                      color: fontAppColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: const [
          IconCartWidget(),
          SizedBox(
            width: 25,
          )
        ],
        forceMaterialTransparency: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255));
  }
}

class DetailInfo extends StatelessWidget {
  final Shop shop;
  const DetailInfo({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
        child: Column(
          children: [
            const Row(
              children: [
                StarsWidget(rate: '4.5'),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 5),
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    color: iconAppColor,
                  ),
                ),
                RegularAppText(
                  text: '1222',
                  color: iconAppColor,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                RegularAppText(text: shop.description, align: TextAlign.start),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                DecoratedBox(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () => {}, icon: const Icon(Icons.share))),
                const SizedBox(
                  width: 15,
                ),
                DecoratedBox(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () => {}, icon: const Icon(Icons.comment))),
                const SizedBox(
                  width: 15,
                ),
                DecoratedBox(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.star_rounded,
                          size: 30,
                        )))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoldAppText(color: Colors.black, text: 'Horario'),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(
                              width: 10,
                            ),
                            RegularAppText(
                                text: shop.openingHours[0],
                                size: context.width > 550 ? 20 : 16)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoldAppText(
                            color: Colors.black, text: 'Dirección'),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            RegularAppText(
                                text: shop.shopLocation,
                                size: context.width > 550 ? 20 : 15)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoldAppText(
                            color: Colors.black, text: 'Contacto'),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                networkContact(
                                    const Icon(Icons.phone), shop.phoneNumber),
                                const SizedBox(width: 25),
                                networkContact(
                                  const Icon(Icons.phone_android_outlined),
                                  shop.whatsAppNumber,
                                ),
                                const SizedBox(height: 25),
                                networkContact(
                                    const Icon(Icons.camera_alt_rounded),
                                    shop.instagramAccount),
                                const SizedBox(height: 25),
                                networkContact(const Icon(Icons.facebook),
                                    shop.facebookAccount),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoldAppText(color: Colors.black, text: 'Enlace'),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const RegularAppText(
                              text: 'Enlace a grupo',
                              size: 18,
                              color: Colors.blue,
                              textDecoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              child: RegularAppText(
                                text: shop.optionalLink,
                                size: 20,
                              ),
                              onTap: () async {
                                Uri url = Uri.parse(shop.optionalLink);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print('No se pudo lanzar $url');
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }

  Row networkContact(Icon icon, String contact) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 10),
        RegularAppText(text: contact, size: 20),
      ],
    );
  }
}
