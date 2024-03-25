import 'package:bisne/src/models/auth/domain/dtos/login_dto.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';

Future<bool> loginUser(LoginDto registerUserDto) async {
  var base = r'''
query getAllUsers{
    usuarios {
      id
      nombre
      correo
    }
}
''';

  final QueryOptions options = QueryOptions(document: gql(base));

  try {
    final QueryResult response = await client.query(options);
    if (!response.hasException) {
      print(response.data);
      return true;
    } else {
      print(response.data);
      return false;
    }
  } catch (error) {
    return false;
  }
}
