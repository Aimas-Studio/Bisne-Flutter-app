import 'package:graphql_flutter/graphql_flutter.dart';

final createProductMutation = gql(r'''
mutation addOferta(
  $shopId : ID!, 
  $name : String!, 
  $description : String!, 
  $labelId : ID!, 
  $imageURL : String!,
  $categoryId : ID!,
  $price : Int!,
){
    addOferta(input: {
    imageURL: $imageURL,
    tiendaId: $shopId,
    etiquetaId: $labelId,
    categoriaId: $categoryId,
    nombre: $name,
    precio: $price,
    descripcion: $description,
  })
  {
   oferta{
    id
   } 
  }
}


''');

final createLabelMutation = gql(r'''
mutation addLabel(
  $name : String!, 
){
  addEtiqueta(input: {
    nombre: $name,
  }){
    etiqueta{
      id
    }
  }
}
''');

final getAllProducts = gql(r'''
  query (
    $shopId : ID!
  ){
    tiendaOfertas(id: $shopId) {
    id
    imageURL
    etiquetaId
    categoriaId
    precio
    nombre
  }
}
''');

final getLabelName = gql(r'''
  query (
    $labelId : ID!
  ){
    etiqueta(id: $labelId) {
      nombre
    }
  }
''');

final addProductToFavorite = gql(r'''
mutation addProductToFavorite(
    $userId : ID!
    $itemId : ID!
){
  addUsuarioOfertaFav(input: {
    usuarioId: $userId,
    ofertaId: $itemId,
    
  }){
    usuarioOfertaFav{
      usuarioId
    }
  }
}
''');

final getFavoriteProducts = gql(r''' 
query getFavoriteProducts(
  $id: ID!,
){
  usuarioOfertasFav(id: $id){
    id
    tiendaId
    imageURL
    descripcion
    etiquetaId
    categoriaId
    precio
    nombre
  }}''');
