import 'package:bisne/src/models/cart/domain/dtos/cart_dto.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/infrastructure/graphql/graphql_config.dart';
import '../infrastructure/graphql/mutations.dart';

Future<bool> MakeBuy(cartDTO cartDTO) async {
  final MutationOptions options =
      MutationOptions(document: makeFacture, variables: {
    'addressToSend': cartDTO.addressToSend,
    'date': cartDTO.date,
    'userId': cartDTO.userId,
    // 'items': cartDTO.items
    //     .map((key, value) => MapEntry(key.id, value))
  });
  try {
    final QueryResult response = await client.mutate(options);

    if (!response.hasException) {
      for (var item in cartDTO.items.keys) {
        final MutationOptions ofertOptions =
            MutationOptions(document: makeFactureOfert, variables: {
          'ofertId': item.id,
          'factureId': response.data!['addFactura']['factura']['id'],
          'count': cartDTO.items[item],
          'totalCount': cartDTO.items[item]! * item.price,
        });

        final QueryResult responseOfert = await client.mutate(ofertOptions);
        if (responseOfert.hasException) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
