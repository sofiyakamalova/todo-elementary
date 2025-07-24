import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink('https://graphqlzero.almansi.me/api');

final GraphQLClient client = GraphQLClient(
  cache: GraphQLCache(store: HiveStore()),
  link: httpLink,
);
