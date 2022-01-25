import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'planet.dart';

class PlanetarySystem {
  //declare member variable
  final Random _random = Random();
  String name = "";
  List<Planet> planets = const[];
  //[] for optional, initializing formal
  //named parameter
  //compile time constant list for planets
  PlanetarySystem({this.name = 'Unnamed System', this.planets = const[]});

  //named constructor to allow reading from JSON file
  PlanetarySystem.fromJsonFile(String fileName) {
    Map planetarySystemMap = readPlanetarySystemFromJson(fileName);
    List planetDataFromJson = getPlanetsFromPlanetarySystemMap(planetarySystemMap);
    this.name = getNameFromPlanetarySystemMap(planetarySystemMap);
    this.planets = planetDataFromJson.map(
        (entry) => Planet(name: entry['name'], description: entry['description'])
      ).toList();
  }

  //property
  int get numberOfPlanets => planets.length;
  bool get hasNoPlanets => planets.isEmpty;

  Planet randomPlanet() {
    if (hasNoPlanets) return Planet.nullPlanet();
    return planets[_random.nextInt(planets.length)];
  }

  Planet planetWithName(String name) {
    return planets.firstWhere(
      (planet) => planet.name == name,
      orElse: () => Planet.nullPlanet()
    );
  }

  Map readPlanetarySystemFromJson(String fileName) {
    Map planetarySystemMap = jsonDecode(new File(fileName).readAsStringSync());
    return planetarySystemMap;
  }

  //by default returns an empty list
  List getPlanetsFromPlanetarySystemMap(Map planetarySystemMap) {
    return planetarySystemMap['planets'] ?? [];
  }

  //by default returns special name 'NULL'
  String getNameFromPlanetarySystemMap(Map planetarySystemMap) {
    return planetarySystemMap['name'] ?? 'NULL';
  }
}