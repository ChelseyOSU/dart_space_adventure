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
  return planetData.entries.map(
    (entry) => Planet(name: entry.key, description: entry.value)
  ).toList();
}
