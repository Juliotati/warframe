import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/primary_weapon.dart';

part 'primary_weapon_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PrimaryWeaponModel extends PrimaryWeapon {
  const PrimaryWeaponModel({
    required this.name,
    required this.uniqueName,
    required this.type,
    required this.description,
    required this.disposition,
    required this.wikiaUrl,
    required this.wikiaThumbnail,
    required this.trigger,
    required this.criticalChance,
    required this.criticalMultiplier,
    required this.fireRate,
    required this.totalDamage,
    required this.masteryReq,
    required this.accuracy,
    required this.noise,
    required this.ammo,
    required this.magazineSize,
    required this.reloadTime,
    required this.damageTypes,
  }) : super(
          name: name,
          uniqueName: uniqueName,
          type: type,
          description: description,
          disposition: disposition,
          wikiaUrl: wikiaUrl,
          wikiaThumbnail: wikiaThumbnail,
          trigger: trigger,
          criticalChance: criticalChance,
          criticalMultiplier: criticalMultiplier,
          fireRate: fireRate,
          totalDamage: totalDamage,
          masteryReq: masteryReq,
          accuracy: accuracy,
          noise: noise,
          ammo: ammo,
          magazineSize: magazineSize,
          reloadTime: reloadTime,
          damageTypes: damageTypes,
        );

  factory PrimaryWeaponModel.fromJson(Map<String, dynamic> json) =>
      _$PrimaryWeaponModelFromJson(json);

  final String name;
  final String uniqueName;
  final String type;
  final String description;
  final int? disposition;
  final String? wikiaUrl;
  final String? wikiaThumbnail;
  final String? trigger;
  final num? criticalChance;
  final num? criticalMultiplier;
  final num? fireRate;
  final num? totalDamage;
  final int? masteryReq;
  final num? accuracy;
  final String? noise;
  final num? ammo;
  final int? magazineSize;
  final num? reloadTime;
  final Map<String, dynamic>? damageTypes;

  Map<String, dynamic> toJson() => _$PrimaryWeaponModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        uniqueName,
        type,
        description,
        disposition,
        wikiaUrl,
        wikiaThumbnail,
        trigger,
        disposition,
        criticalChance,
        criticalMultiplier,
        fireRate,
        totalDamage,
        masteryReq,
        accuracy,
        noise,
        ammo,
        magazineSize,
        reloadTime,
        damageTypes,
      ];
}
