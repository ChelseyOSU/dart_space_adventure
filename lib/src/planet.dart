class Planet {
  final String name;
  final String description;
  Planet({required this.name, required this.description});

  //named constructor
  Planet.nullPlanet(): name = 'Null', description = 'Null';
}