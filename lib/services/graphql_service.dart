import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late GraphQLClient _client;

  GraphQLService() {
    HttpLink link = HttpLink('https://rickandmortyapi.com/graphql/');

    _client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  Future<QueryResult> performQuery(String query,
      {required Map<String, dynamic> variables}) async {
    QueryOptions options =
        QueryOptions(variables: variables, document: gql(query),);

    final result = await _client.query(options);

    return result;
  }
}
