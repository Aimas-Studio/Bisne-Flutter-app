import '../../../Utils/Entities/notification.dart';
import '../../../Utils/Entities/shop.dart';

Future<List<AppNotification>> getNotifications() async {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      AppNotification(
          ShopDump("Clary",
              "https://www.bing.com/images/search?view=detailV2&ccid=RQM0roOr&id=BE37E9763310A654A5CD7D49088729BFDF838FA3&thid=OIP.RQM0roOrfbi3W00nz9K8ogHaHa&mediaurl=https%3a%2f%2fjb-labotech.pl%2fwp-content%2fuploads%2f2021%2f05%2fAutomatyczny-tester-szorowania-na-mokro-BV.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.450334ae83ab7db8b75b4d27cfd2bca2%3frik%3do4%252bD378phwhJfQ%26pid%3dImgRaw%26r%3d0&exph=1200&expw=1200&q=bv+jb&simid=608051822271530472&FORM=IRPRST&ck=9DBE6FBB50A4F448462288BBD0C44A96&selectedIndex=5&itb=0&ajaxhist=0&ajaxserp=0"),
          "notification 1",
          "Yesterday"),
      AppNotification(
          ShopDump("Coly",
              "https://www.bing.com/images/search?view=detailV2&ccid=RQM0roOr&id=BE37E9763310A654A5CD7D49088729BFDF838FA3&thid=OIP.RQM0roOrfbi3W00nz9K8ogHaHa&mediaurl=https%3a%2f%2fjb-labotech.pl%2fwp-content%2fuploads%2f2021%2f05%2fAutomatyczny-tester-szorowania-na-mokro-BV.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.450334ae83ab7db8b75b4d27cfd2bca2%3frik%3do4%252bD378phwhJfQ%26pid%3dImgRaw%26r%3d0&exph=1200&expw=1200&q=bv+jb&simid=608051822271530472&FORM=IRPRST&ck=9DBE6FBB50A4F448462288BBD0C44A96&selectedIndex=5&itb=0&ajaxhist=0&ajaxserp=0"),
          "notification 2",
          "7:35"),
    ];
  });
}
