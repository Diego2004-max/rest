import 'package:flutter/material.dart';
import '../models/country_model.dart';

class DetailScreen extends StatelessWidget {

  final Country country;

  const DetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(country.name),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Image.network(
              country.flag,
              height: 120,
            ),

            const SizedBox(height: 20),

            Text(
              country.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text("Capital: ${country.capital}",
                style: const TextStyle(fontSize: 18)),

            Text("Region: ${country.region}",
                style: const TextStyle(fontSize: 18)),

            Text("Population: ${country.population}",
                style: const TextStyle(fontSize: 18)),

          ],
        ),
      ),
    );
  }
}