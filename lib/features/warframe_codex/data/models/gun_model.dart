import 'package:json_annotation/json_annotation.dart';
import 'package:warframe/features/warframe_codex/domain/entities/gun.dart';

part 'gun_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GunModel extends Gun {
  const GunModel({
    required this.name,
    required this.uniqueName,
    required this.type,
    required this.description,
    required this.disposition,
    required this.category,
    required this.wikiaUrl,
    required this.wikiaThumbnail,
    required this.trigger,
    required this.criticalChance,
    required this.criticalMultiplier,
    required this.fireRate,
    required this.totalDamage,
    required this.masteryReq,
    required this.accuracy,
    required this.sentinel,
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
          category: category,
          wikiaUrl: wikiaUrl,
          wikiaThumbnail: wikiaThumbnail,
          trigger: trigger,
          criticalChance: criticalChance,
          criticalMultiplier: criticalMultiplier,
          fireRate: fireRate,
          totalDamage: totalDamage,
          masteryReq: masteryReq,
          accuracy: accuracy,
          sentinel: sentinel,
          noise: noise,
          ammo: ammo,
          magazineSize: magazineSize,
          reloadTime: reloadTime,
          damageTypes: damageTypes,
        );

  factory GunModel.fromJson(Map<String, dynamic> json) =>
      _$GunModelFromJson(json);

  final String name;
  final String uniqueName;
  final String type;
  final String description;
  final int? disposition;
  final String? category;
  final String? wikiaUrl;
  final String? wikiaThumbnail;
  final String? trigger;
  final num? criticalChance;
  final num? criticalMultiplier;
  final num? fireRate;
  final num? totalDamage;
  final int? masteryReq;
  final num? accuracy;
  final bool? sentinel;
  final String? noise;
  final num? ammo;
  final int? magazineSize;
  final num? reloadTime;
  final Map<String, dynamic>? damageTypes;

  Map<String, dynamic> toJson() => _$GunModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        uniqueName,
        type,
        description,
        disposition,
        category,
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
        sentinel,
        noise,
        ammo,
        magazineSize,
        reloadTime,
        damageTypes,
      ];
}
