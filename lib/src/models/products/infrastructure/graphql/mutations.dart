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
