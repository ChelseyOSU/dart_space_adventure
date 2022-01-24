import 'dart:math';
import 'planet.dart';

class PlanetarySystem {
  //declare member variable
  final Random _random = Random();
  final String name;
  final List<Planet> planets;
  //[] for optional, initializing formal
  //named parameter
  //compile time constant list for planets
  PlanetarySystem({this.name = 'Unnamed System', this.planets = const[]});

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
}