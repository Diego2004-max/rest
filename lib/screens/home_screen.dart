import 'package:flutter/material.dart';
import '../controllers/country_controller.dart';
import '../controllers/graphql_controller.dart';
import '../models/country_model.dart';
import '../widgets/country_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CountryController controller = CountryController();
  final GraphQLController graphqlController = GraphQLController();

  List<Country> countries = [];
  List<Country> filteredCountries = [];

  bool loading = true;
  bool useGraphQL = false;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  void loadCountries() async {

    List<Country> data;

    if (useGraphQL) {
      data = await graphqlController.getCountries();
    } else {
      data = await controller.getCountries();
    }

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

        actions: [

          Row(
            children: [

              const Text("REST"),

              Switch(
                value: useGraphQL,
                onChanged: (value) {

                  setState(() {
                    useGraphQL = value;
                    loading = true;
                  });

                  loadCountries();
                },
              ),

              const Text("GraphQL"),

            ],
          )

        ],
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