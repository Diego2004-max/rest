import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class RestService {

  Future<List<Country>> fetchCountries() async {

    final url = Uri.parse("https://restcountries.com/v3.1/all?fields=name,capital,region,population,flags");

    final response = await http.get(url);

    if (response.statusCode == 200) {

      List data = json.decode(response.body);

      return data.map((e) => Country.fromJson(e)).toList();

    } else {

      throw Exception("Failed to load countries");

    }
  }
}