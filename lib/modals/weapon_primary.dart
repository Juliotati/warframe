import 'package:json_annotation/json_annotation.dart';

part 'weapon_primary.g.dart';

@JsonSerializable(explicitToJson: true)
class PrimaryWeapon {
  PrimaryWeapon({
    this.name,
    this.category,
    this.type,
    this.description,
    this.wikiaUrl,
    this.wikiaThumbnail,
    this.trigger,
    this.criticalChance,
    this.criticalMultiplier,
    this.fireRate,
    this.damage,
    this.totalDamage,
    this.masteryReq,
    this.accuracy,
    this.noise,
    this.ammo,
    this.magazineSize,
    this.reloadTime,
    this.damageTypes,
  });

  factory PrimaryWeapon.fromJson(Map<String, dynamic> json) =>
      _$PrimaryWeaponFromJson(json);

  dynamic name;
  dynamic category;
  dynamic type;
  dynamic description;
  dynamic wikiaUrl;
  dynamic wikiaThumbnail;
  dynamic trigger;
  dynamic criticalChance;
  dynamic criticalMultiplier;
  dynamic fireRate;
  dynamic damage;
  dynamic totalDamage;
  dynamic masteryReq;
  dynamic accuracy;
  dynamic noise;
  dynamic ammo;
  dynamic magazineSize;
  dynamic reloadTime;
  Map<String, dynamic>? damageTypes;

  Map<String, dynamic> toJson() => _$PrimaryWeaponToJson(this);
}
