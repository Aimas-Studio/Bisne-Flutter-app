import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../domain/dtos/edit_shop_dto.dart';
import '../graphql/mutations.dart';

final persistentData = PersistentData();

Future<bool> editShop(EditShopDto shopDto) async {
  final MutationOptions options = MutationOptions(
    document: editShopMutation,
    variables: {
      'id': persistentData.idUser,
      'description': shopDto.description,
      'shopSchedule': shopDto.schedule,
      'urlImage': shopDto.urlImage,
      'shopPhoneNumber': shopDto.phoneNumber,
      'shopWhatsApp': shopDto.whatsAppNumber,
      'shopInstagram': shopDto.instagram,
      'shopFacebook': shopDto.facebook,
      'shopLink': shopDto.link,
    },
  );

  try {
    final QueryResult response = await client.mutate(options);
    if (!response.hasException) {
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
