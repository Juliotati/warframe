import 'package:warframe/export/warframe_ui.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/primary_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/secondary_weapon_model.dart';
import 'package:warframe/features/warframe_codex/presentation/widgets/widgets.dart';

class WeaponProfile extends StatelessWidget {
  const WeaponProfile.primary({
    Key? key,
    required this.primary,
    this.secondary,
    this.melee,
  })  : assert(secondary == null || melee == null,
            'Use this constructor only for primary weapons category'),
        super(key: key);

  const WeaponProfile.secondary({
    Key? key,
    required this.secondary,
    this.primary,
    this.melee,
  })  : assert(primary == null || melee == null,
            'Use this constructor only for secondary weapons category'),
        super(key: key);

  const WeaponProfile.melee({
    Key? key,
    this.secondary,
    this.primary,
    required this.melee,
  })  : assert(primary == null || secondary == null,
            'Use this constructor only for melee weapons category'),
        super(key: key);

  final MeleeWeaponModel? melee;
  final PrimaryWeaponModel? primary;
  final SecondaryWeaponModel? secondary;

  static const String route = 'weapon-profile';

  @override
  Widget build(BuildContext context) {
    if (primary != null) {
      return PrimaryWeaponProfile(primary!);
    } else if (secondary != null) {
      return SecondaryWeaponProfile(secondary!);
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
    this.primary,
    this.secondary,
    this.melee,
    this.isMeleeHeavyStats = false,
  }) : super(key: key);

  final PrimaryWeaponModel? primary;
  final SecondaryWeaponModel? secondary;
  final MeleeWeaponModel? melee;
  final bool isMeleeHeavyStats;

  @override
  Widget build(BuildContext context) {
    List<Widget> weaponStatsBody() {
      if (primary != null) {
        return primaryWeaponStat(primary!);
      } else if (secondary != null) {
        return secondaryWeaponStat(secondary!);
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
        if (data is int || data is double) StatsText(double.parse('$data').toStringAsFixed(2)),
        if (data is String) StatsText('$data'.toUpperCase()),
      ],
    );
  }
}
