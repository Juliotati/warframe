class Warframe {
  String uniqueName;
  String name;
  String description;
  int health;
  int shield;
  int armor;
  int stamina;
  int power;
  int masteryReq;
  int sprintSpeed;
  String passiveDescription;
  List<String> exalted;
  List<Abilities> abilities;
  String productCategory;
  int buildPrice;
  int buildTime;
  int skipBuildTimePrice;
  int buildQuantity;
  bool consumeOnBuild;
  List<Components> components;
  String type;
  String imageName;
  String category;
  bool tradable;
  List<Patchlogs> patchlogs;
  bool conclave;
  int color;
  String introduced;
  List<String> polarities;
  String sex;
  int sprint;
  String wikiaThumbnail;
  String wikiaUrl;

  Warframe({
    this.uniqueName,
    this.name,
    this.description,
    this.health,
    this.shield,
    this.armor,
    this.stamina,
    this.power,
    this.masteryReq,
    this.sprintSpeed,
    this.passiveDescription,
    this.exalted,
    this.abilities,
    this.productCategory,
    this.buildPrice,
    this.buildTime,
    this.skipBuildTimePrice,
    this.buildQuantity,
    this.consumeOnBuild,
    this.components,
    this.type,
    this.imageName,
    this.category,
    this.tradable,
    this.patchlogs,
    this.conclave,
    this.color,
    this.introduced,
    this.polarities,
    this.sex,
    this.sprint,
    this.wikiaThumbnail,
    this.wikiaUrl,
  });

  Warframe.fromJson(Map<String, dynamic> json) {
    uniqueName = json['uniqueName'];
    name = json['name'];
    description = json['description'];
    health = json['health'];
    shield = json['shield'];
    armor = json['armor'];
    stamina = json['stamina'];
    power = json['power'];
    masteryReq = json['masteryReq'];
    sprintSpeed = json['sprintSpeed'];
    passiveDescription = json['passiveDescription'];
    exalted = json['exalted'].cast<String>();
    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }
    productCategory = json['productCategory'];
    buildPrice = json['buildPrice'];
    buildTime = json['buildTime'];
    skipBuildTimePrice = json['skipBuildTimePrice'];
    buildQuantity = json['buildQuantity'];
    consumeOnBuild = json['consumeOnBuild'];
    if (json['components'] != null) {
      components = new List<Components>();
      json['components'].forEach((v) {
        components.add(new Components.fromJson(v));
      });
    }
    type = json['type'];
    imageName = json['imageName'];
    category = json['category'];
    tradable = json['tradable'];
    if (json['patchlogs'] != null) {
      patchlogs = new List<Patchlogs>();
      json['patchlogs'].forEach((v) {
        patchlogs.add(new Patchlogs.fromJson(v));
      });
    }
    conclave = json['conclave'];
    color = json['color'];
    introduced = json['introduced'];
    polarities = json['polarities'].cast<String>();
    sex = json['sex'];
    sprint = json['sprint'];
    wikiaThumbnail = json['wikiaThumbnail'];
    wikiaUrl = json['wikiaUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniqueName'] = this.uniqueName;
    data['name'] = this.name;
    data['description'] = this.description;
    data['health'] = this.health;
    data['shield'] = this.shield;
    data['armor'] = this.armor;
    data['stamina'] = this.stamina;
    data['power'] = this.power;
    data['masteryReq'] = this.masteryReq;
    data['sprintSpeed'] = this.sprintSpeed;
    data['passiveDescription'] = this.passiveDescription;
    data['exalted'] = this.exalted;
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    data['productCategory'] = this.productCategory;
    data['buildPrice'] = this.buildPrice;
    data['buildTime'] = this.buildTime;
    data['skipBuildTimePrice'] = this.skipBuildTimePrice;
    data['buildQuantity'] = this.buildQuantity;
    data['consumeOnBuild'] = this.consumeOnBuild;
    if (this.components != null) {
      data['components'] = this.components.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    data['imageName'] = this.imageName;
    data['category'] = this.category;
    data['tradable'] = this.tradable;
    if (this.patchlogs != null) {
      data['patchlogs'] = this.patchlogs.map((v) => v.toJson()).toList();
    }
    data['conclave'] = this.conclave;
    data['color'] = this.color;
    data['introduced'] = this.introduced;
    data['polarities'] = this.polarities;
    data['sex'] = this.sex;
    data['sprint'] = this.sprint;
    data['wikiaThumbnail'] = this.wikiaThumbnail;
    data['wikiaUrl'] = this.wikiaUrl;
    return data;
  }
}

class Abilities {
  String name;
  String description;

  Abilities({this.name, this.description});

  Abilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Components {
  String uniqueName;
  String name;
  String description;
  int itemCount;
  String imageName;
  bool tradable;
  List<Drops> drops;

  Components(
      {this.uniqueName,
      this.name,
      this.description,
      this.itemCount,
      this.imageName,
      this.tradable,
      this.drops});

  Components.fromJson(Map<String, dynamic> json) {
    uniqueName = json['uniqueName'];
    name = json['name'];
    description = json['description'];
    itemCount = json['itemCount'];
    imageName = json['imageName'];
    tradable = json['tradable'];
    if (json['drops'] != null) {
      drops = new List<Drops>();
      json['drops'].forEach((v) {
        drops.add(new Drops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniqueName'] = this.uniqueName;
    data['name'] = this.name;
    data['description'] = this.description;
    data['itemCount'] = this.itemCount;
    data['imageName'] = this.imageName;
    data['tradable'] = this.tradable;
    if (this.drops != null) {
      data['drops'] = this.drops.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drops {
  String location;
  String type;
  double chance;
  String rarity;

  Drops({this.location, this.type, this.chance, this.rarity});

  Drops.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    type = json['type'];
    chance = json['chance'];
    rarity = json['rarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['type'] = this.type;
    data['chance'] = this.chance;
    data['rarity'] = this.rarity;
    return data;
  }
}

class Patchlogs {
  String name;
  String date;
  String url;
  String additions;
  String changes;
  String fixes;
  String imgUrl;

  Patchlogs(
      {this.name,
      this.date,
      this.url,
      this.additions,
      this.changes,
      this.fixes,
      this.imgUrl});

  Patchlogs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    url = json['url'];
    additions = json['additions'];
    changes = json['changes'];
    fixes = json['fixes'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['url'] = this.url;
    data['additions'] = this.additions;
    data['changes'] = this.changes;
    data['fixes'] = this.fixes;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
