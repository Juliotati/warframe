abstract class Weapon {
  const Weapon({
    required this.name,
    required this.uniqueName,
    required this.type,
    required this.description,
    required this.disposition,
    required this.wikiaUrl,
    required this.wikiaThumbnail,
    required this.criticalChance,
    required this.criticalMultiplier,
    required this.totalDamage,
    required this.masteryReq,
    required this.damageTypes,
  });

  final String name;
  final String uniqueName;
  final String type;
  final String description;
  final int? disposition;
  final String? wikiaUrl;
  final String? wikiaThumbnail;
  final num? criticalChance;
  final num? criticalMultiplier;
  final num? totalDamage;
  final int? masteryReq;
  final Map<String, dynamic>? damageTypes;
}
