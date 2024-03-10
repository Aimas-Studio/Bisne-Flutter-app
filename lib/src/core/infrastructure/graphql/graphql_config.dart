import 'package:bisne/src/core/infrastructure/env/env.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// final HttpLink httpLink = HttpLink(Env.apiUrl);
final HttpLink httpLink = HttpLink('http://192.168.245.209/graphql');

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
);
