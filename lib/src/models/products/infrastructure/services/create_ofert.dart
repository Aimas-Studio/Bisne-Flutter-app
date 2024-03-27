import 'package:bisne/src/core/domain/entities/categories/categories.dart';
import 'package:bisne/src/models/products/infrastructure/graphql/mutations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../domain/dto/create_ofert_dto.dart';

final _data = PersistentData();

Future<bool> createOfert({required CreateOfertDto OfertDto}) async {
  final MutationOptions optionsLabel = MutationOptions(
    document: createLabelMutation,
    variables: {
      'name': OfertDto.labelId,
    },
  );
  try {
    final QueryResult response = await client.mutate(optionsLabel);
    if (!response.hasException) {
      final MutationOptions options = MutationOptions(
        document: createProductMutation,
        variables: {
          'shopId': OfertDto.shopId,
          'name': OfertDto.name,
          'description': OfertDto.description,
          'labelId': response.data!['addEtiqueta']['etiqueta']['id'],
          'imageURL': OfertDto.imageURL,
          'categoryId': categories[OfertDto.categoryId],
          'price': int.parse(OfertDto.price),
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
  } catch (error) {
    return false;
  }
  return false;
}
