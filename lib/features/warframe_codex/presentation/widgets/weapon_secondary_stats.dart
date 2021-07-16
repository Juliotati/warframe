part of widgets;

List<WeaponStat> secondaryWeaponStat(SecondaryWeaponModel weapon) {
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

class SecondaryWeaponProfile extends StatelessWidget {
  const SecondaryWeaponProfile(this.secondary, {Key? key}) : super(key: key);

  static const String route = 'secondary-profile';
  final SecondaryWeaponModel secondary;

  @override
  Widget build(BuildContext context) {
    return CodexDataScaffold(
      label: secondary.name,
      body: CodexItemDetailsBodyWrapper(
        children: <Widget>[
          WeaponThumbnailAndBio(
            weapon: WeaponModel(
              name: secondary.name,
              uniqueName: secondary.uniqueName,
              type: secondary.type,
              description: secondary.description,
              wikiaUrl: secondary.wikiaUrl,
              wikiaThumbnail: secondary.wikiaThumbnail,
            ),
          ),
          StatsTitle('Mastery Req', data: '${secondary.masteryReq}'),
          WeaponStatsContainer(secondary: secondary),
        ],
      ),
    );
  }
}
