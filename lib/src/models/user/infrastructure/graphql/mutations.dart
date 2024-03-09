import 'package:graphql_flutter/graphql_flutter.dart';

final editUserMutation = gql(r'''
  mutation editUser($userName: String!, $urlImage: String) {
    editUser(input : {userName: $userName, urlImage: $urlImage}) {
      user {
        id
        username
        imageUrl
      }
            
      errors{
        message
      }
    }
  }
''');
