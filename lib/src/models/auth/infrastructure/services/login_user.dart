import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:bisne/src/models/auth/domain/dtos/login_dto.dart';
import 'package:bisne/src/models/auth/infrastructure/graphql/mutations.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/infrastructure/graphql/graphql_config.dart';

final _data = PersistentData();

Future<bool> loginUser(LoginDto registerUserDto) async {
  var base = r'''
query getAllUsers{
    usuarios {
      id
      nombre
      correo
      password
    }
}
''';

  final QueryOptions options =
      QueryOptions(document: gql(base), fetchPolicy: FetchPolicy.networkOnly);

  try {
    final QueryResult response = await client.query(options);
    if (!response.hasException) {
      var emailFound = false;
      for (var user in response.data!['usuarios']) {
        if (user['correo'] == registerUserDto.email) {
          emailFound = true;
          if (user['password'] == registerUserDto.password) {
            _data.loggedIn = true;
            _data.idUser = user['id'];
            _data.userEmail = user['correo'];
            _data.userName = user['nombre'];
            return true;
          }
          Get.showSnackbar(const GetSnackBar(
              message: 'Su contraseña no coincide',
              duration: Duration(seconds: 2)));
          return false;
        }
      }
      Get.showSnackbar(const GetSnackBar(
          message: 'No hay usuarios con ese correo',
          duration: Duration(seconds: 2)));
      return false;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}

Future<bool> isAdminUser() async {
  final QueryOptions options = QueryOptions(
      document: getAllAdmins, fetchPolicy: FetchPolicy.networkOnly);
  try {
    final QueryResult response = await client.query(options);
    if (!response.hasException) {
      for (var admin in response.data!['administradores']) {
        if (admin['id'] == _data.idUser) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}

Future<bool> getShop() async {
  final QueryOptions options =
      QueryOptions(document: getShopByAdmin, variables: {
    'adminId': _data.idUser,
  });
  try {
    final QueryResult response = await client.query(options);
    if (!response.hasException) {
      _data.shopName = response.data!['administradorTienda'][0]['nombre'];
      _data.shopAdminId =
          response.data!['administradorTienda'][0]['administradorId'];
      _data.shopCategory = '';
      _data.shopId = response.data!['administradorTienda'][0]['id'];
      _data.shopRegion = response.data!['administradorTienda'][0]['provincia'];
      _data.shopMunicipality =
          response.data!['administradorTienda'][0]['municipio'];
      _data.shopExists = true;
      _data.shopImageUrl = response.data!['administradorTienda'][0]['imageURL'];
      _data.description =
          response.data!['administradorTienda'][0]['descripcion'];
      _data.shopOpeningTime =
          response.data!['administradorTienda'][0]['horario'];
      _data.shopExists = true;
      return true;
    } else {
      return false;
    }
  } catch (error) {
    return false;
  }
}
