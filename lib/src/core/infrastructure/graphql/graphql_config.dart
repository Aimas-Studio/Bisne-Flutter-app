import 'package:bisne/src/Pages/shop/infrastructure/graphql/gql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink('http://192.168.131.209/graphql');

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
);
