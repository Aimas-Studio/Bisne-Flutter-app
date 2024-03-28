import 'package:graphql_flutter/graphql_flutter.dart';

final makeFacture = gql(r'''
mutation makeFacture(
  $addressToSend: String, 
  $date: Date!, 
  $userId: ID!, 
  ) {
  addFactura( input: {
    direccion_envio: $addressToSend, 
    fecha: $date, 
    usuarioid: $userId
    }){
    factura{
      id
      fecha
    }
  }
}
''');

final makeFactureOfert = gql(r'''
mutation makeFactureOfert(
  $ofertId: ID!,
  $factureId: ID!,
  $count: Float!,
  $totalCount: Float!,
){
    addFacturaOferta(input: {
        ofertaId: $ofertId,
        facturaId: $factureId,
        cantidad: $count,
        montototal: $totalCount,
    })
    {
        facturaOferta{
            facturaId
        }
    }
}
''');
