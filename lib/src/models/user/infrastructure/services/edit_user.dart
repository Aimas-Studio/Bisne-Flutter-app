import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/edit_user_dto.dart';
import '../graphql/mutations.dart';

Future<bool> editUser(EditUserDto editUserDto) async {
  final MutationOptions options = MutationOptions(
    document: editUserMutation,
    variables: {
      'userName': editUserDto.userName,
      'urlImage': editUserDto.urlImage,
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
