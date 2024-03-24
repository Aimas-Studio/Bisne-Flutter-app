import 'package:graphql_flutter/graphql_flutter.dart';

// String createShopMutation(CreateShopDto shopDto) {
//   return '''
//     mutation {
//       addTienda(input: {
//         nombre: "${shopDto.name}",
//         descripcion: "${shopDto.description}",
//         horario: "${shopDto.schedule}",
//         urlImagen: "${shopDto.urlImage}",
//         administradorId: ${shopDto.adminId}
//       }) {
//         tienda {
//           id
//           nombre
//           descripcion
//           horario
//           imageURL
//           administradorId
//         }
//         errors {
//           message
//         }
//       }
//     }
//   ''';
// }

final createShopMutation = gql(r'''
mutation addTienda(
  $adminId : ID, 
  $name : String, 
  $description : String, 
  $shopSchedule : String, 
  $urlImage : String,
  $shopPhoneNumber : String,
  $shopWhatsApp : String,
  $shopLocation : String,
  $shopInstagram : String,
  $shopFacebook : String,
  $shopLink : String, 
  $direccion : String,
  $provincia : String,
  $municipio : String,
  $usuarioTelegram : String,
){
  addTienda(input:{
    administradorId : $adminId,
    nombre : $name,
    descripcion : $description,
    horario : $shopSchedule,
    urlImagen : $urlImage,
    numeroTelefono : $shopPhoneNumber,
    numeroWhatsapp : $shopWhatsApp,
    linkFacebook : $shopFacebook,
    linkInstagram : $shopInstagram,
    linkExtra : $shopLink,
    direccion : $direccion,
    provincia : $provincia,
    municipio : $municipio,
    usuarioTelegram : $usuarioTelegram,
    }
  ){
    tienda {
      administradorId
      nombre
      descripcion
      horario
      urlImagen
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
    errors {
      field    
      message
    }    
  }
}


''');

final editShopMutation = gql(r'''
mutation updateTienda(
  $shopId : int,
  $description, 
  $shopSchedule : String, 
  $urlImage : String,
  $shopPhoneNumber : String,
  $shopWhatsApp : String,
  $shopLocation : String,
  $shopInstagram : String,
  $shopFacebook : String,
  $shopLink : String, 
){ 
  updateTienda(input:{
    id : $shopId, 
    descripcion : $description,
    horario : $shopSchedule,
    urlImagen : $urlImage,
    numeroTelefono : $shopPhoneNumber,
    numeroWhatsapp : $shopWhatsApp,
    linkFacebook : $shopFacebook,
    linkInstagram : $shopInstagram,
    linkExtra : $shopLink,
  }
  ){
      tienda {
      nombre
      descripcion
      horario
      urlImagen
      numeroTelefono
      numeroWhatsapp
      linkFacebook
      linkInstagram
      linkExtra
    }
    
    errors{
      message
    }
    
  }
}
''');
