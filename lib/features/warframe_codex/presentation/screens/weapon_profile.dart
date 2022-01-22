part of warframe_codex;

class WeaponProfile extends StatelessWidget {
  const WeaponProfile._({required this.child});

  factory WeaponProfile.gun(GunModel gun) {
    return WeaponProfile._(child: GunProfile(gun));
  }

  factory WeaponProfile.melee(MeleeWeaponModel melee) {
    return WeaponProfile._(child: MeleeWeaponProfile(melee));
  }

  static const String route = '/weapon-profile';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class WeaponStatsContainer extends StatelessWidget {
  const WeaponStatsContainer({
    Key? key,
    this.weapon,
    this.melee,
    this.isMeleeHeavyStats = false,
  }) : super(key: key);

  final GunModel? weapon;
  final MeleeWeaponModel? melee;
  final bool isMeleeHeavyStats;

  List<Widget> get weaponStats {
    if (weapon != null) return gunStat(weapon!);

    return isMeleeHeavyStats
        ? meleeWeaponHeavyAttacksStat(melee!)
        : meleeWeaponStat(melee!);
  }

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      verticalMargin: 0,
      child: Column(
        children: weaponStats,
      ),
    );
  }
}

class WeaponStat extends StatelessWidget {
  const WeaponStat({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  final String label;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        StatsText(label),
        const Spacer(),
        if (data is int || data is double)
          StatsText(double.parse('$data').toStringAsFixed(2)),
        if (data is String) StatsText('$data'.toUpperCase()),
      ],
    );
  }
}
