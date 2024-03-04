import '../../domain/dtos/create_shop_dto.dart';

String createShopMutation(CreateShopDto shopDto) {
  return '''
    mutation {
      addTienda(input: {
        nombre: "${shopDto.name}",
        descripcion: "${shopDto.description}",
        horario: "${shopDto.schedule}",
        urlImagen: "${shopDto.urlImage}",
        administradorId: ${shopDto.adminId}
      }) {
        tienda {
          id
          nombre
          descripcion
          horario
          imageURL
          administradorId
        }
        errors {
          message
        }
      }
    }
  ''';
}
