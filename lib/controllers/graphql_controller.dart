import '../graphql/graphql_service.dart';
import '../models/country_model.dart';

class GraphQLController {

  final GraphQLService service = GraphQLService();

  Future<List<Country>> getCountries() async {

    final data = await service.fetchCountries();

    return data.map((country) {

      return Country(
        name: country['name'] ?? 'Unknown',
        capital: country['capital'] ?? 'No capital',
        region: country['continent']['name'] ?? 'Unknown',
        population: 0,
        flag: country['emoji'] ?? '',
      );

    }).toList();
  }
}