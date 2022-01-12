part of warframe_codex;

class WeaponProfile extends StatelessWidget {
  const WeaponProfile.gun({
    Key? key,
    required this.gun,
    this.melee,
  })  : assert(melee == null, 'Use this constructor only for gun category'),
        super(key: key);

  const WeaponProfile.melee({
    Key? key,
    this.gun,
    required this.melee,
  })  : assert(
          gun == null,
          'Use this constructor only for melee weapons category',
        ),
        super(key: key);

  final MeleeWeaponModel? melee;
  final GunModel? gun;

  static const String route = 'weapon-profile';

  @override
  Widget build(BuildContext context) {
    if (gun != null) {
      return GunProfile(gun!);
    } else if (melee != null) {
      return MeleeWeaponProfile(melee!);
    } else {
      return const Center(
        child: Text('No Data'),
      );
    }
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

  @override
  Widget build(BuildContext context) {
    List<Widget> weaponStatsBody() {
      if (weapon != null) {
        return gunStat(weapon!);
      } else {
        return isMeleeHeavyStats
            ? meleeWeaponHeavyAttacksStat(melee!)
            : meleeWeaponStat(melee!);
      }
    }

    return WarframeContainer(
      verticalMargin: 0,
      child: Column(
        children: weaponStatsBody(),
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
