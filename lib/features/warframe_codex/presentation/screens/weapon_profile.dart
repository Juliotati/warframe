import 'package:warframe/export/warframe_ui.dart';
import 'package:warframe/features/warframe_codex/data/models/melee_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/primary_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/secondary_weapon_model.dart';
import 'package:warframe/features/warframe_codex/data/models/weapon_model.dart';
import 'package:warframe/features/warframe_codex/presentation/widgets/widgets.dart';

class WeaponProfile extends StatelessWidget {
  const WeaponProfile.primary({
    Key? key,
    required this.primary,
    this.secondary,
    this.melee,
  })  : assert(secondary == null,
            'Use this constructor only for the primary weapons category'),
        super(key: key);

  const WeaponProfile.secondary({
    Key? key,
    required this.secondary,
    this.primary,
    this.melee,
  })  : assert(primary == null || melee == null,
            'Use this constructor only for the secondary weapons category'),
        super(key: key);

  const WeaponProfile.melee({
    Key? key,
    this.secondary,
    this.primary,
    required this.melee,
  })  : assert(primary == null || secondary == null,
            'Use this constructor only for the melee weapons category'),
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
        ],
      ),
    );
  }
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
        ],
      ),
    );
  }
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
        ],
      ),
    );
  }
}
