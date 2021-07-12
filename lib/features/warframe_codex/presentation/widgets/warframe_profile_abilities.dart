part of widgets;

class AbilitiesList extends StatefulWidget {
  const AbilitiesList({
    Key? key,
    required this.warframe,
  }) : super(key: key);

  final WarframeModel warframe;

  @override
  _AbilitiesListState createState() => _AbilitiesListState();
}

class _AbilitiesListState extends State<AbilitiesList> {
  int currentIndex = 0;
  final List<AbilitiesModel> ability = <AbilitiesModel>[];

  void toggleAbility(int newIndex) {
    activeAbility[currentIndex] = false;
    activeAbility[newIndex] = true;
    setState(() => currentIndex = newIndex);
  }

  List<bool> activeAbility = <bool>[true, false, false, false, false];

  Future<void> addPassiveAbility() async {
    final WarframeModel _warframe = widget.warframe;
    final AbilitiesModel passiveAbility = AbilitiesModel(
      name: 'Passive',
      description: _warframe.passiveDescription ??
          '${_warframe.name} has no passive ability',
    );
    if (!_warframe.abilities.contains(passiveAbility)) {
      _warframe.abilities.insert(0, passiveAbility);
    }
    ability.addAll(_warframe.abilities);
  }

  @override
  void initState() {
    addPassiveAbility();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Transform.translate(
          offset: const Offset(0, 20.0),
          child: WarframeContainer(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                widget.warframe.abilities[currentIndex].description,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 1.0),
                    ),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              for (int i = 0; i < ability.length; i++)
                WarframeContainer(
                  onTap: () => toggleAbility(i),
                  withShadow: activeAbility[i],
                  child: Text(
                    ability[i].name,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(0, 0, 0, 1.0),
                          fontSize: 16,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
