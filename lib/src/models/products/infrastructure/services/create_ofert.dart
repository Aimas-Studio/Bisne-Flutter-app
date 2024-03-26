import 'package:bisne/src/models/products/infrastructure/graphql/mutations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../domain/dto/create_ofert_dto.dart';

final _data = PersistentData();

Future<bool> createOfert({required CreateOfertDto OfertDto}) async {
  final MutationOptions options = MutationOptions(
    document: createProductMutation,
    variables: {
      'shopId': OfertDto.shopId,
      'name': OfertDto.name,
      'description': OfertDto.description,
      'labelId': OfertDto.labelId,
      'imageURL': OfertDto.imageURL,
      'categoryId': OfertDto.categoryId,
      'price': OfertDto.price,
    },
  );

  try {
    final QueryResult response = await client.mutate(options);
    if (!response.hasException) {
      _data.shopName = response.data!['tienda']['nombre'];
      _data.shopAdminId = response.data!['tienda']['administradorId'];
      _data.shopCategory = '';
      _data.shopId = response.data!['tienda']['id'];
      _data.shopRegion = response.data!['tienda']['provincia'];
      _data.shopMunicipality = response.data!['tienda']['municipio'];
      _data.shopExists = true;
      _data.shopImageUrl = response.data!['tienda']['imageURL'];
      _data.description = response.data!['tienda']['descripcion'];
      _data.shopOpeningTime = response.data!['tienda']['horario'];
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
