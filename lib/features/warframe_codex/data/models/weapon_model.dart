import 'package:json_annotation/json_annotation.dart';
import 'package:warframe/features/warframe_codex/domain/entities/weapon.dart';

part 'weapon_model.g.dart';

@JsonSerializable()
class WeaponModel extends Weapon {
  const WeaponModel({
    required this.name,
    required this.uniqueName,
    required this.type,
    required this.description,
    this.disposition,
    required this.wikiaUrl,
    required this.wikiaThumbnail,
    this.criticalChance,
    this.criticalMultiplier,
    this.totalDamage,
    this.masteryReq,
    this.damageTypes,
  }) : super(
          name: name,
          uniqueName: uniqueName,
          type: type,
          description: description,
          disposition: disposition,
          wikiaUrl: wikiaUrl,
          wikiaThumbnail: wikiaThumbnail,
          criticalChance: criticalChance,
          criticalMultiplier: criticalMultiplier,
          totalDamage: totalDamage,
          masteryReq: masteryReq,
          damageTypes: damageTypes,
        );

  factory WeaponModel.fromJson(Map<String, dynamic> json) {
    return _$WeaponModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeaponModelToJson(this);

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
