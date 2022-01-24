import 'dart:io';
import 'dart:math';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {
  // constructor
  final PlanetarySystem planetarySystem;
  SpaceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if (planetarySystem.hasNoPlanets) {
      print('Aw, there are no planets to explore.');
    } else {
      travel(
        promptForRandomOrSpecificDestination(
          'Shall I randomly choose a planet for you to visit? (Y or N)'
        )
      );
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numberOfPlanets} planets to explore');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync() ?? '';
  }

  void printIntroduction(String name) {
    print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  void travel(bool randomDestination) {
    Planet planet = Planet.nullPlanet();
    if (randomDestination) {
      planet = planetarySystem.randomPlanet();
    } else {
      planet = planetarySystem.planetWithName(responseToPrompt('Name the planet you would like to visit.'));
    }
    travelTo(planet);
  }

  // does not support function overloading
  void travelTo(Planet planet) {
    print('Traveling to ${planet.name}...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer = '';
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y' ) {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I didn\'t get that.');
      }
    }
    return false;
  }
}


