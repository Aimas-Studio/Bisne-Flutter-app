import 'package:graphql_flutter/graphql_flutter.dart';

final editUserMutation = gql(r'''
  mutation editUser(
    $userId: ID!,
    $userName: String,
    $urlImage: String,
  ){
    updateUsuario(input: {
    id: $userId,
    nombre: $userName,
    imageUrl: $urlImage,
  }){
    usuario{
      nombre
      imageURL
    }
  }
}
''');
