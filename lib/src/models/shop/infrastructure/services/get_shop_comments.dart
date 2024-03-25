import '../../../user/export.dart';
import '../../../valorations/domain/entities/comment_entity.dart';

Future<List<AppComment>> getShopComments() async {
  return Future.delayed(const Duration(seconds: 2), () {
    return [
      AppComment(
          user: User(
              username: "Clary",
              id: '1',
              email: 'asdkajsd',
              imageUrl:
                  "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          body: "notification 1",
          date: "Yesterday"),
      AppComment(
          user: User(
              id: '2',
              email: 'ashdjhsjjdh',
              username: "Coly",
              imageUrl:
                  "https://media.istockphoto.com/id/495605964/es/foto/gen%C3%A9rico-compacto-de-red.webp?s=612x612&w=is&k=20&c=JWOVVmSTVQbCsKh3IH_riogOmetjjlpl49ll1LJvkO4="),
          date: "notification 2",
          body: "7:35"),
    ];
  });
}
