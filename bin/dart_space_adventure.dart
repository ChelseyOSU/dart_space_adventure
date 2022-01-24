import 'package:dart_space_adventure/dart_space_adventure.dart';

void main(List<String> arguments) {
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: 'Solar System', planets: []
    )
  ).start();
}

List<Planet> mockPlanets() {
  return [
    Planet(
      name: 'Mercury',
      description: 'A very hot planet, closet to the sun.'
    ),
    Planet(
      name: 'Saturn',
      description: 'A very cold planet, furtherest to the sun.'
    ),
    Planet(
      name: 'Earth',
      description: 'Home, sweet home.'
    )
  ];
}
