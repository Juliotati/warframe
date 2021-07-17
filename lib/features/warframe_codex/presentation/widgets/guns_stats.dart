part of widgets;

List<WeaponStat> gunStat(GunModel weapon) {
  return <WeaponStat>[
    WeaponStat(label: 'Accuracy', data: weapon.accuracy),
    WeaponStat(label: 'Fire Rate', data: weapon.fireRate),
    WeaponStat(label: 'Critical Chance', data: weapon.criticalChance),
    WeaponStat(label: 'Critical Multiplier', data: weapon.criticalMultiplier),
    WeaponStat(label: 'Magazine', data: weapon.magazineSize),
    WeaponStat(label: 'Noite', data: weapon.noise),
    WeaponStat(label: 'Riven Disposition', data: weapon.disposition),
    WeaponStat(label: 'Reload', data: weapon.reloadTime),
    WeaponStat(label: 'Trigger', data: weapon.trigger),
  ];
}

class GunProfile extends StatelessWidget {
  const GunProfile(this.weapon, {Key? key}) : super(key: key);

  static const String route = 'gun-profile';
  final GunModel weapon;

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: weapon.name,
      body: CodexItemDetailsBodyWrapper(
        children: <Widget>[
          WeaponThumbnailAndBio(
            weapon: WeaponModel(
              name: weapon.name,
              uniqueName: weapon.uniqueName,
              type: weapon.type,
              description: weapon.description,
              wikiaUrl: weapon.wikiaUrl,
              wikiaThumbnail: weapon.wikiaThumbnail,
            ),
          ),
          StatsTitle('Mastery Req', data: '${weapon.masteryReq}'),
          WeaponStatsContainer(weapon: weapon),
          StatsTitle('Total Damage', data: '${weapon.totalDamage}'),
        ],
      ),
    );
  }
}
