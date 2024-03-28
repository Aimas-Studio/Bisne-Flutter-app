import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../models/home/presentations/controllers/home_page_controller.dart';
import '../../../../models/products/infrastructure/graphql/mutations.dart';
import '../../../../models/shop/infrastructure/graphql/mutations.dart';
import '../../../infrastructure/graphql/graphql_config.dart';

class FavoriteButton extends StatefulWidget {
  final double size;
  final bool isFavorite;
  final bool isShop;
  final String id;

  const FavoriteButton({
    super.key,
    required this.size,
    required this.isFavorite,
    required this.isShop,
    required this.id,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState(size,
      isfavorite: isFavorite, isShop: isShop, id: id);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final double size;
  bool isfavorite;
  bool isShop;
  String id;
  _FavoriteButtonState(this.size,
      {required this.isfavorite, required this.isShop, required this.id});
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: size,
      child: SizedBox(
        height: 35,
        width: 40,
        child: Center(
          child: IconButton(
            style: IconButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
            ),
            onPressed: () async {
              if (!isfavorite) {
                if (await addToFavorite(id, isShop)) {
                  isfavorite = true;
                }
              }
              setState(() {});
            },
            icon: Icon(
              isfavorite ? Icons.favorite : Icons.favorite_border,
              color: isfavorite ? Colors.red : Colors.black,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> addToFavorite(String id, bool isShop) async {
    try {
      final MutationOptions options = MutationOptions(
        document: isShop ? addShopToFavorite : addProductToFavorite,
        variables: {'userId': PerData.idUser, 'itemId': id},
      );
      final QueryResult result = await client.mutate(options);
      if (!result.hasException) return true;
    } catch (e) {
      print('No se pudo añadir a favoritos');
    }
    return false;
  }
}
