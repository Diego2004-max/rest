import 'package:flutter/material.dart';
import '../models/country_model.dart';
import '../screens/detail_screen.dart';

class CountryCard extends StatelessWidget {

  final Country country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {

    bool isUrl = country.flag.startsWith("http");

    return Card(

      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      child: ListTile(

        leading: isUrl
            ? Image.network(
                country.flag,
                width: 50,
                height: 30,
                fit: BoxFit.cover,
              )
            : Text(
                country.flag,
                style: const TextStyle(fontSize: 30),
              ),

        title: Text(country.name),

        subtitle: Text(
          "Capital: ${country.capital}\nRegion: ${country.region}",
        ),

        onTap: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(country: country),
            ),
          );

        },

      ),
    );
  }
}