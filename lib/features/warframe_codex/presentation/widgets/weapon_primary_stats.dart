part of widgets;

List<WeaponStat> primaryWeaponStat(PrimaryWeaponModel weapon) {
  return <WeaponStat>[
    WeaponStat(label: 'Accuracy', data: weapon.accuracy),
    WeaponStat(label: 'Fire Rate', data: weapon.fireRate),
    WeaponStat(label: 'Critical Chance', data: weapon.criticalChance),
    WeaponStat(label: 'Critical Multiplier', data: weapon.criticalMultiplier),
    WeaponStat(label: 'Magazine', data: weapon.magazineSize),
    WeaponStat(label: 'Noite', data: weapon.noise),
    WeaponStat(label: 'Riven Disposition', data: weapon.disposition),
    WeaponStat(label: 'Reload', data: weapon.reloadTime),
    const WeaponStat(label: 'Status', data: 'MISSING'),
    WeaponStat(label: 'Trigger', data: weapon.trigger),
  ];
}

class PrimaryWeaponProfile extends StatelessWidget {
  const PrimaryWeaponProfile(this.primary, {Key? key}) : super(key: key);

  static const String route = 'primary-profile';
  final PrimaryWeaponModel primary;

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: primary.name,
      body: CodexItemDetailsBodyWrapper(
        children: <Widget>[
          WeaponThumbnailAndBio(
            weapon: WeaponModel(
              name: primary.name,
              uniqueName: primary.uniqueName,
              type: primary.type,
              description: primary.description,
              wikiaUrl: primary.wikiaUrl,
              wikiaThumbnail: primary.wikiaThumbnail,
            ),
          ),
          StatsTitle('Mastery Req', data: '${primary.masteryReq}'),
          WeaponStatsContainer(primary: primary),
          StatsTitle('Total Damage', data: '${primary.totalDamage}'),
        ],
      ),
    );
  }
}
