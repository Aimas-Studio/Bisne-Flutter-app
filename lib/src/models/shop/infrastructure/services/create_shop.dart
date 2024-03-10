import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/create_shop_dto.dart';
import '../graphql/mutations.dart';

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
