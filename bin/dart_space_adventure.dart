import 'package:dart_space_adventure/dart_space_adventure.dart';

const systemName = 'Solary System';
const planetData = {
  'Mercury': 'A very hot planet, closet to the sun.',
  'Saturn': 'A very cold planet, furtherest to the sun.',
  'Earth': 'Home, sweet home.'
};

void main(List<String> arguments) {
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: systemName,
      planets: mockPlanets()
    )
  ).start();
}

List<Planet> mockPlanets() {
  List<Planet> planets = [];
  planetData.forEach((key, value) {
    var name = key;
    var description = value;
    var planet = Planet(name: name, description: description);
    planets.add(planet);
  });
  return planets;
}
