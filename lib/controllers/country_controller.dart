import '../models/country_model.dart';
import '../services/rest_service.dart';

class CountryController {

  final RestService _service = RestService();

  Future<List<Country>> getCountries() {

    return _service.fetchCountries();

  }

}