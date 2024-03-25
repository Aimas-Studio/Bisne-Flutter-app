import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/register_user_dto.dart';
import '../graphql/mutations.dart';

Future<bool> registerUser(RegisterUserDto registerUserDto) async {
  var base = r'''
mutation registrarUsuario{
  addUsuario(input:{
    nombre : "username",
    correo : "email",
    password : "passp",
  }
  ){
    usuario {
      id
      nombre
      correo
    }
    errors {
      message
    }
  }
}
''';
  base = base.replaceAll('username', registerUserDto.userName);
  base = base.replaceAll('email', registerUserDto.email);
  base = base.replaceAll('passp', registerUserDto.password);

  final MutationOptions options = MutationOptions(document: gql(base)
      // registerUserMutation,
      // variables: {
      //   'username': registerUserDto.userName,
      //   'email': registerUserDto.email,
      //   'password': registerUserDto.password,
      // },
      );

  try {
    final QueryResult response = await client.mutate(options);
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
