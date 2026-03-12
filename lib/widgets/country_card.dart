import 'package:flutter/material.dart';
import '../models/country_model.dart';
import '../screens/detail_screen.dart';

class CountryCard extends StatelessWidget {

  final Country country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      child: ListTile(

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(country: country),
            ),
          );
        },

        leading: Image.network(
          country.flag,
          width: 50,
        ),

        title: Text(country.name),

        subtitle: Text(
          "Capital: ${country.capital}\nRegion: ${country.region}",
        ),

      ),

    );
  }
}