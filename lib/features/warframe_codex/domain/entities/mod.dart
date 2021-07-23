abstract class Mod {
  const Mod({
    required this.baseDrain,
    required this.category,
    required this.compatName,
    required this.fufionLimit,
    required this.name,
    required this.polarity,
    required this.rarity,
    required this.type,
    required this.wikiaThumbnail,
    required this.wikiaUrl,
  });

  final int baseDrain;
  final String category;
  final String compatName;
  final int fufionLimit;
  final String name;
  final String polarity;
  final String rarity;
  final String type;
  final String wikiaThumbnail;
  final String wikiaUrl;
}
