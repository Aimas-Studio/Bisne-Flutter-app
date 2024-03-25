import 'package:graphql_flutter/graphql_flutter.dart';

final registerUserMutation = gql(r'''
mutation registrarUsuario(
  $username : String!,
  $email : String!,
  $password : String!,    
){
  addUsuario(input:{
    nombre : $username,
    correo : $email,
    password : $password,
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
''');
