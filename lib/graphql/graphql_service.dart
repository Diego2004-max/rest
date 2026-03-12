import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {

  static final HttpLink httpLink =
      HttpLink('https://countries.trevorblades.com/');

  static GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );

  Future<List<dynamic>> getCountries() async {

    const String query = """
      query {
        countries {
          name
          capital
          emoji
        }
      }
    """;

    final result = await client.query(
      QueryOptions(
        document: gql(query),
      ),
    );

    return result.data?['countries'] ?? [];

  }
}