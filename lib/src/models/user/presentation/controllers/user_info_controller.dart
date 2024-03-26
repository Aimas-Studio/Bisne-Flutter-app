import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:bisne/src/models/base/presentation/controllers/base_page_controller.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  final _data = PersistentData();
  static const id = 'userInfoController';
  UserInfoController();
  logout() {
    _data.loggedIn = false;
    Get.showSnackbar(const GetSnackBar(
        message: 'Ha cerrado sesión satisfactoriamente',
        duration: Duration(seconds: 2)));
    final baseController = Get.find<BasePageController>();
    final homeController = Get.find<HomePageController>();
    homeController.setLogout();
    baseController.obj = 2;
  }
}
