import 'package:graphql_flutter/graphql_flutter.dart';

final registerUserMutation = gql(r'''
mutation registrarUsuario(
  $username : String,
  $email : String,
  $password : String,    
){
  registrarUsuario(input:{
    username : $username,
    email : $email,
    password : $password,
  }
  ){
    usuario {
      id
      username
      email
    }
    errors {
      message
    }
  }
}
''');
