import 'package:flutter/foundation.dart';
import 'package:warframe/modals/warframe.dart';

class Warframe with ChangeNotifier {
  final String name;
  final String image;
  final String bio;
  final int health;
  final int shield;
  final int armor;
  final int energy;
  final double sprint;
  final List<Abilities> abilities;
  // final String abilityOne;
  // final String abilityOneName;
  // final String abilityTwo;
  // final String abilityTwoName;
  // final String abilityThree;
  // final String abilityThreeName;
  // final String abilityFour;
  // final String abilityFourName;
  final String passive;
  final String passiveBio;
  final String lore;

  Warframe({
    @required this.image,
    @required this.name,
    @required this.bio,
    @required this.health,
    @required this.shield,
    @required this.armor,
    @required this.energy,
    @required this.sprint,
    @required this.abilities,
    // @required this.abilityOne,
    // @required this.abilityOneName,
    // @required this.abilityTwo,
    // @required this.abilityTwoName,
    // @required this.abilityThree,
    // @required this.abilityThreeName,
    // @required this.abilityFour,
    // @required this.abilityFourName,
    @required this.passive,
    @required this.passiveBio,
    @required this.lore,
  });
}

class CodexCategory {
  final String name;

  const CodexCategory({
    @required this.name,
  });
}

class Archwing {
  final String name;
  final String image;
  final String bio;

  const Archwing({
    @required this.name,
    @required this.image,
    @required this.bio,
  });
}

class Primary {
  final String name;
  final String image;
  final String bio;

  const Primary({
    @required this.name,
    @required this.image,
    @required this.bio,
  });
}

class Secondary {
  final String name;
  final String image;
  final String bio;

  const Secondary({
    @required this.name,
    @required this.image,
    @required this.bio,
  });
}

class Melee {
  final String name;
  final String image;
  final String bio;

  const Melee({
    @required this.name,
    @required this.image,
    @required this.bio,
  });
}
