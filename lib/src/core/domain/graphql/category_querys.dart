import 'package:graphql_flutter/graphql_flutter.dart';

final getAllCategories = gql(r'''
query getAllCategories{
  categorias{
    id
    nombre
  }
}
''');
