import 'package:bisne/src/core/domain/entities/categories/categories.dart';
import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../infrastructure/graphql/graphql_config.dart';
import '../graphql/category_querys.dart';

Future<bool> getCategories() async {
  final QueryOptions options = QueryOptions(
    document: getAllCategories,
  );

  try {
    final QueryResult response = await client.query(options);
    if (!response.hasException) {
      for (var data in (response.data!['categorias'] as List)) {
        if (categories.containsKey(data['nombre'])) {
          categories[data["nombre"]] = data["id"];
        } else {
          categories.addAll({data['nombre']: data['id']});
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
