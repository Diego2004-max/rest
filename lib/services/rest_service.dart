import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';
import '../core/api_constants.dart';

class RestService {

  Future<List<Country>> fetchCountries() async {

    final url = Uri.parse(
      ApiConstants.baseUrl + ApiConstants.allCountries
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data
          .map((json) => Country.fromJson(json))
          .toList();

    } else {

      throw Exception("Error loading countries");

    }

  }

}