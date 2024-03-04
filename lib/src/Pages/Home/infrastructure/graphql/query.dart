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
    }
  }
''');
