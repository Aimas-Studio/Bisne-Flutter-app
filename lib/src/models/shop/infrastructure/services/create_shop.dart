import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../base/presentation/controllers/base_page_controller.dart';
import '../../../home/presentations/controllers/home_page_controller.dart';
import '../../domain/dtos/create_shop_dto.dart';
import '../graphql/mutations.dart';

final _data = PersistentData();

Future<bool> createShop({required CreateShopDto shopDto}) async {
  // final MutationOptions options = MutationOptions(
  //   document: gql(createShopMutation(
  //       shopDto)), // this is the mutation string you just created
  // );

  // final QueryResult result = await client.mutate(options);

  //TODO save data response in local storage

  // if (result.hasException) {
  //   print(result.exception.toString());
  // } else {
  //   print('Shop created');
  // }
  final MutationOptions options = MutationOptions(
    document: createShopMutation,
    variables: {
      'adminId': shopDto.adminId,
      'name': shopDto.name,
      'description': shopDto.description,
      'shopSchedule': shopDto.schedule ?? '',
      'imageURL': shopDto.urlImage,
      'shopPhoneNumber': shopDto.phoneNumber ?? '',
      'shopWhatsApp': shopDto.whatsAppNumber ?? '',
      'shopInstagram': shopDto.instagram ?? '',
      'shopFacebook': shopDto.facebook ?? '',
      'shopLink': shopDto.link ?? '',
      'direccion': shopDto.location ?? '',
      'provincia': shopDto.region,
      'municipio': shopDto.municipality,
      'usuarioTelegram': shopDto.telegram ?? '',
    },
  );

  try {
    final QueryResult response = await client.mutate(options);
    if (!response.hasException) {
      _data.shopName = response.data!['addTienda']['tienda']['nombre'];
      _data.shopAdminId =
          response.data!['addTienda']['tienda']['administradorId'];
      _data.shopCategory = '';
      _data.shopId = response.data!['addTienda']['tienda']['id'];
      _data.shopRegion = response.data!['addTienda']['tienda']['provincia'];
      _data.shopMunicipality =
          response.data!['addTienda']['tienda']['municipio'];
      _data.shopExists = true;
      _data.shopImageUrl = response.data!['addTienda']['tienda']['imageURL'];
      _data.description = response.data!['addTienda']['tienda']['descripcion'];
      _data.shopOpeningTime = response.data!['addTienda']['tienda']['horario'];
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
