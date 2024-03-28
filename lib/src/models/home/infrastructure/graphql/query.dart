import 'package:graphql_flutter/graphql_flutter.dart';

final getAllShops = gql('''
  query {
    tiendas {
  id
  nombre
  descripcion
  horario
  numeroWhatsapp
  numeroTelefono
  usuarioTelegram
  linkFacebook
  linkInstagram
  linkExtra
  imageURL
  administradorId
  direccion
  provincia
  municipio
    }
  }
''');

final getShopById = gql(r'''
  query getShopById(
    $id: ID!
  ){
    tienda (id: $id){
  id
  nombre
  descripcion
  horario
  numeroWhatsapp
  numeroTelefono
  usuarioTelegram
  linkFacebook
  linkInstagram
  linkExtra
  imageURL
  administradorId
  direccion
  provincia
  municipio
    }
  }
''');

final getFavoriteShops = gql(r'''
query getFavoriteShops(
  $userId: ID!
){
  usuarioTiendasFav(id: $userId){
    id
    nombre
    descripcion
    horario
    numeroWhatsapp
    numeroTelefono
    usuarioTelegram
    linkFacebook
    linkInstagram
    linkExtra
    imageURL
    administradorId
    direccion
    provincia
    municipio
  }
}
''');
