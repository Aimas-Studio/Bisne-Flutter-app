import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/register_user_dto.dart';
import '../graphql/mutations.dart';

final PersistentData _data = PersistentData();

Future<bool> registerUser(RegisterUserDto registerUserDto) async {
  final MutationOptions options = MutationOptions(
    document: registerUserMutation,
    variables: {
      'username': registerUserDto.userName,
      'email': registerUserDto.email,
      'password': registerUserDto.password,
    },
  );

  try {
    final QueryResult response = await client.mutate(options);
    if (!response.hasException) {
      _data.idUser = response.data!['addUsuario']['usuario']['id'];
      _data.userEmail = response.data!['addUsuario']['usuario']['correo'];
      _data.userName = response.data!['addUsuario']['usuario']['nombre'];
      _data.loggedIn = true;
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
