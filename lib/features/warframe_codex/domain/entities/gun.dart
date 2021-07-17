import 'package:equatable/equatable.dart';
import 'weapon.dart';

abstract class Gun extends Equatable implements Weapon {
  const Gun({
    required this.name,
    required this.uniqueName,
    required this.type,
    required this.description,
    required this.wikiaUrl,
    required this.wikiaThumbnail,
    required this.trigger,
    required this.disposition,
    required this.criticalChance,
    required this.criticalMultiplier,
    required this.fireRate,
    required this.totalDamage,
    required this.masteryReq,
    required this.accuracy,
    required this.sentinel,
    required this.category,
    required this.noise,
    required this.ammo,
    required this.magazineSize,
    required this.reloadTime,
    required this.damageTypes,
  });

  @override
  final String name;
  @override
  final String uniqueName;
  @override
  final String type;
  @override
  final String description;
  @override
  final int? disposition;
  @override
  final String? wikiaUrl;
  @override
  final String? wikiaThumbnail;
  @override
  final num? criticalChance;
  @override
  final num? criticalMultiplier;

  @override
  final num? totalDamage;
  @override
  final int? masteryReq;
  @override
  final Map<String, dynamic>? damageTypes;
  final String? category;
  final String? trigger;
  final String? noise;
  final bool? sentinel;
  final num? accuracy;
  final num? fireRate;
  final num? ammo;
  final int? magazineSize;
  final num? reloadTime;
}
