import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/register_user_dto.dart';
import '../graphql/mutations.dart';

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
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
