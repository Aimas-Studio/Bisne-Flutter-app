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

final getShopByAdmin = gql(r'''
query getShopbyAdmin(
  $adminId: ID!
){
    administradorTienda(id: $adminId){
      id
      administradorId
      nombre
      descripcion
      horario
      imageURL
      numeroTelefono
      numeroWhatsapp
      linkFacebook
      linkInstagram
      linkExtra
      direccion
      provincia
      municipio
      usuarioTelegram
    }
}
''');

final getAllAdmins = gql(r'''
query getAllAdmins{
    administradores {
      id
    }
}
''');
