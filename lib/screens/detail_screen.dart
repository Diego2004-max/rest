import 'package:flutter/material.dart';
import '../models/country_model.dart';

class DetailScreen extends StatelessWidget {

  final Country country;

  const DetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {

    bool isUrl = country.flag.startsWith("http");

    return Scaffold(

      appBar: AppBar(
        title: Text(country.name),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            const SizedBox(height: 20),

            isUrl
                ? Image.network(
                    country.flag,
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : Text(
                    country.flag,
                    style: const TextStyle(fontSize: 100),
                  ),

            const SizedBox(height: 30),

            Text(
              "Capital: ${country.capital}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              "Region: ${country.region}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              "Population: ${country.population}",
              style: const TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}