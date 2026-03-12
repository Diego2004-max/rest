import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {

  static final HttpLink httpLink =
      HttpLink('https://countries.trevorblades.com/');

  final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );

  Future<List<dynamic>> fetchCountries() async {

    const String query = """
    query {
      countries {
        name
        capital
        emoji
        continent {
          name
        }
      }
    }
    """;

    final result = await client.query(
      QueryOptions(
        document: gql(query),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['countries'] ?? [];
  }
}