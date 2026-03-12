import 'package:flutter/material.dart';
import '../controllers/country_controller.dart';
import '../models/country_model.dart';
import '../widgets/country_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CountryController controller = CountryController();

  List<Country> countries = [];
  List<Country> filteredCountries = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  void loadCountries() async {

    final data = await controller.getCountries();

    setState(() {
      countries = data;
      filteredCountries = data;
      loading = false;
    });
  }

  void searchCountry(String query) {

    final results = countries.where((country) {

      final name = country.name.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input);

    }).toList();

    setState(() {
      filteredCountries = results;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Global Explorer"),
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(

              children: [

                Padding(
                  padding: const EdgeInsets.all(10),

                  child: TextField(

                    decoration: const InputDecoration(
                      labelText: "Search country",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),

                    onChanged: searchCountry,
                  ),
                ),

                Expanded(
                  child: ListView.builder(

                    itemCount: filteredCountries.length,

                    itemBuilder: (context, index) {

                      return CountryCard(
                        country: filteredCountries[index],
                      );

                    },
                  ),
                ),

              ],
            ),
    );
  }
}