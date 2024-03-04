import 'package:bisne/src/Pages/shop/infrastructure/graphql/mutations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/create_shop_dto.dart';

Future<void> createShop({required CreateShopDto shopDto}) async {
  print("estoy guardando");
  final MutationOptions options = MutationOptions(
    document: gql(createShopMutation(
        shopDto)), // this is the mutation string you just created
  );

  final QueryResult result = await client.mutate(options);

  if (result.hasException) {
    print(result.exception.toString());
  } else if (result.isLoading) {
    print('Loading');
  } else {
    print('Shop created');
  }
}
