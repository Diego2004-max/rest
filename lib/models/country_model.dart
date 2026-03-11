class Country {

  final String name;
  final String capital;
  final String region;
  final int population;
  final String flag;

  Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.flag,
  });

    factory Country.fromJson(Map<String, dynamic> json) {

    String capitalName = "No capital";

    if (json["capital"] != null && json["capital"].length > 0) {
      capitalName = json["capital"][0];
    }

    return Country(
      name: json["name"]["common"] ?? "Unknown",
      capital: capitalName,
      region: json["region"] ?? "Unknown",
      population: json["population"] ?? 0,
      flag: json["flags"]["png"] ?? "",
    );
  }
}