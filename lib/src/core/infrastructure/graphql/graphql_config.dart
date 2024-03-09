import 'package:bisne/src/core/infrastructure/env/env.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(Env.apiUrl);

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(),
  link: httpLink,
);
