part of widgets;

List<WeaponStat> meleeWeaponStat(MeleeWeaponModel weapon) {
  return <WeaponStat>[
    // WeaponStat(label: 'Attack Speed', data: weapon.attackSpeed),
    WeaponStat(label: 'Fire Rate', data: weapon.blockingAngle),
    WeaponStat(label: 'Combo Duration', data: weapon.comboDuration),
    WeaponStat(label: 'Critical Chance', data: weapon.criticalChance),
    WeaponStat(label: 'Follow Through', data: weapon.followThrough),
    WeaponStat(label: 'Range', data: weapon.range),
    WeaponStat(label: 'Riven Disposition', data: weapon.disposition),
    WeaponStat(label: 'Slam Attack', data: weapon.slamAttack),
    WeaponStat(label: 'Slam Radius Damage', data: weapon.slamRadialDamage),
    WeaponStat(label: 'Slam Radius', data: weapon.slamRadius),
  ];
}

List<WeaponStat> meleeWeaponHeavyAttacksStat(MeleeWeaponModel weapon) {
  return <WeaponStat>[
    WeaponStat(label: 'Slam Attack', data: weapon.heavySlamAttack),
    WeaponStat(label: 'Slam Radius Damage', data: weapon.heavySlamRadialDamage),
    WeaponStat(label: 'Slam Radius', data: weapon.heavySlamRadius),
  ];
}

class MeleeWeaponProfile extends StatelessWidget {
  const MeleeWeaponProfile(this.melee, {Key? key}) : super(key: key);

  static const String route = 'melee-profile';
  final MeleeWeaponModel melee;

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: melee.name,
      body: CodexItemDetailsBodyWrapper(
        children: <Widget>[
          WeaponThumbnailAndBio(
            weapon: WeaponModel(
              name: melee.name,
              uniqueName: melee.uniqueName,
              type: melee.type,
              description: melee.description,
              wikiaUrl: melee.wikiaUrl,
              wikiaThumbnail: melee.wikiaThumbnail,
            ),
          ),
          StatsTitle('Mastery Req', data: '${melee.masteryReq}'),
          WeaponStatsContainer(melee: melee),
          const StatsTitle('HEAVY ATTACK'),
          WeaponStatsContainer(melee: melee, isMeleeHeavyStats: true),
        ],
      ),
    );
  }
}
