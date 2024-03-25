import 'package:graphql_flutter/graphql_flutter.dart';

// final HttpLink httpLink = HttpLink(Env.apiUrl);
final HttpLink httpLink = HttpLink('http://192.168.55.209/graphql');

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
);
