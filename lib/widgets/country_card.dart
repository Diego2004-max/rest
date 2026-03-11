import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryCard extends StatelessWidget {

  final Country country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {

    return Card(

      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),

      child: ListTile(

        leading: Image.network(
          country.flag,
          width: 50,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.flag);
          },
        ),

        title: Text(country.name),

        subtitle: Text(
          "Capital: ${country.capital}\nRegion: ${country.region}",
        ),

      ),

    );

  }

}