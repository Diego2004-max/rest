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

  late Future<List<Country>> countries;

  @override
  void initState() {
    super.initState();
    countries = controller.getCountries();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Global Explorer"),
      ),

      body: FutureBuilder<List<Country>>(

        future: countries,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );

          }

          if (snapshot.hasError) {

            return Center(
              child: Text(
                "Error loading countries\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );

          }

          final data = snapshot.data!;

          return ListView.builder(

            itemCount: data.length,

            itemBuilder: (context, index) {

              return CountryCard(
                country: data[index],
              );

            },

          );

        },

      ),

    );
  }
}