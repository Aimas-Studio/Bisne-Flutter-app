import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';
import '../../domain/dtos/edit_user_dto.dart';
import '../graphql/mutations.dart';

Future<bool> editUser(EditUserDto editUserDto) async {
  final MutationOptions options = MutationOptions(
    document: editUserMutation,
    variables: {
      'userId': editUserDto.userId,
      'userName': editUserDto.userName,
      'urlImage': editUserDto.urlImage,
    },
  );

  try {
    final QueryResult response = await client.mutate(options);
    if (!response.hasException) {
      data.userName = editUserDto.userName;
      data.userImageUrl = editUserDto.urlImage;
      return true;
    } else {
      if (response.exception!.linkException.toString() == '') {
        print(response.exception.toString());
      }
      return false;
    }
  } catch (error) {
    return false;
  }
}
