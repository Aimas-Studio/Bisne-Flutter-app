import 'package:get/get.dart';

class CommentController extends GetxController {
  final stars = [true, true, true, true, true].obs;

  set commentValue(int countOfStar) {
    for (var i = 0; i < stars.length; i++) {
      i <= countOfStar ? stars[i] = true : stars[i] = false;
    }
  }
}
