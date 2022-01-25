import 'package:dart_space_adventure/dart_space_adventure.dart';

const fileName = 'bin/planetarySystem.json';

void main(List<String> arguments) {
  SpaceAdventure(
    planetarySystem: PlanetarySystem.fromJsonFile(fileName)
  ).start();
}