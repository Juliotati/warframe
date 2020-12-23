//import '../modals/category.dart';
import 'package:flutter/material.dart';
import '../modals/codex_modals.dart';

//const CODEX_CATEGORIES = const [
//  Category(
//    image: '',
//    title: 'Warframes',
//  ),
//  Category(
//    image: '',
//    title: 'Archwing',
//  ),
//  Category(
//    image: '',
//    title: 'Primary',
//  ),
//  Category(
//    image: '',
//    title: 'Secondary',
//  ),
//  Category(
//    image: '',
//    title: 'Melee',
//  ),
//  Category(
//    image: '',
//    title: 'Companions',
//  ),
//  Category(
//    image: '',
//    title: 'Mods',
//  ),
//];

class CodexWarframes with ChangeNotifier {
  List<Warframe> _items = [
    Warframe(
      name: 'Ash',
      image:
          'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmedia-cache-ak0.pinimg.com%2F736x%2Fd5%2Ff5%2Fcf%2Fd5f5cfe6b3ed56735174ffea71f283bb.jpg&f=1&nofb=1',
      bio:
          'Ash is great for players looking for a more stealthy approach to combat. Lethal abilities are complemented by powers of distraction.',
      health: 150,
      shield: 100,
      armor: 105,
      energy: 100,
      sprint: 1.15,
//    abilityOneImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/2/23/Shuriken130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140714',
      abilityOneName: 'Shuriken',
      abilityOne:
          'Launches a spinning blade of pain, dealing high damage and impaling enemies to walls.',
//    abilityTwoImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/f/f9/SmokeScreen130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140723',
      abilityTwoName: 'Smoke Screen',
      abilityTwo:
          'Drops a smoke bomb that stuns enemies and obscures their vision, rendering Ash invisible for a short time.',
//    abilityThreeImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/d/d8/Teleport130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140749',
      abilityThreeName: 'Teleport',
      abilityThree:
          'Ash teleports towards the target, bringing him into melee range and making enemies vulnerable to finishers.',
//    abilityFourImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/3/3e/BladeStorm130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140451',
      abilityFourName: 'Blade Storm',
      abilityFour:
          'Project fierce shadow clones of Ash upon groups of distant enemies. Join the fray using Teleport.',
      passive: 'Passive',
      passiveBio:
          'Bleed effects inflicted on enemies to 25% increased damage and last 50% longer.',
      lore: '''Ash. Avatar of murder.

Patron saint of the Orokin school of political assassination known as... The Scoria. Each assassin bore a mark: a swirling, smoky-black jewel between their eyes.

"You are forever the Scoria. The Scoria is forever you."

No devotee knew of any life, any thought that was not Scoria Doctrine. For every question, so the Orokin of the Scoria said, Ash was the answer.

Two notable students of the Scoria's anthracite halls were also two brothers: Dom and Pilio. Dom was nimble, cunning, and a quick study with the blade. His brother, Pilio, however, was not so gifted. While he idolized Ash, worshipped him, Pilio lacked Dom's grace and clarity. And Ash's ruthlessness. However... it was Dom who had been captured by the very target he was tasked to kill. A sin unforgivable to the Scoria. So it fell to Pilio - the lesser - to uphold the Scoria by taking Dom's life. By this, the Seven would have assurance that Dom's flaw was not a... familial trait.

You see, as you might expect of an Orokin school of murder, the Scoria were ruthless when it came to... "academic excellence". With Dom dead at Pilio's feet, two essential killings would have taken place: that of a failure, and that of any shred of pity within Pilio. Ash would oversee Pilio's mission.

Pilio's soul was to die that day: as the life drained from his brother's eyes or if he could not do so, beneath the blades of his lifelong idol: Ash.''',
    ),
    Warframe(
      name: 'Ash Prime',
      image:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FhAiVmjuCSPI%2Fmaxresdefault.jpg&f=1&nofb=1',
      bio:
          'Distraction and subterfuge become lethal weapons with Ash Prime. Featuring altered mod polarities for greater customization.',
      health: 150,
      shield: 125,
      armor: 175,
      energy: 100,
      sprint: 1.20,
//    abilityOneImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/2/23/Shuriken130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140714',
      abilityOneName: 'Shuriken',
      abilityOne:
          'Launches a spinning blade of pain, dealing high damage and impaling enemies to walls.',
//    abilityTwoImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/f/f9/SmokeScreen130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140723',
      abilityTwoName: 'Smoke Screen',
      abilityTwo:
          'Drops a smoke bomb that stuns enemies and obscures their vision, rendering Ash invisible for a short time.',
//    abilityThreeImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/d/d8/Teleport130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140749',
      abilityThreeName: 'Teleport',
      abilityThree:
          'Ash teleports towards the target, bringing him into melee range and making enemies vulnerable to finishers.',
//    abilityFourImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/3/3e/BladeStorm130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140451',
      abilityFourName: 'Blade Storm',
      abilityFour:
          'Project fierce shadow clones of Ash upon groups of distant enemies. Join the fray using Teleport.',
      passive: 'Passive',
      passiveBio:
          'Bleed effects inflicted on enemies to 25% increased damage and last 50% longer.',
      lore: '''''',
    ),
    Warframe(
      name: 'Atlas',
      image:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FXh1XRIKQSG8%2Fmaxresdefault.jpg&f=1&nofb=1',
      bio: 'Titan of stones, lord of the earthly elementals.',
      health: 100,
      shield: 100,
      armor: 450,
      energy: 150,
      sprint: 0.90,
//    abilityOneImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/6/61/Landslide130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140548',
      abilityOneName: 'LandSlide',
      abilityOne:
          'Bash enemies with an explosive sliding punch, repeat for a devastating combo.',
//    abilityTwoImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/5/51/Tectonics130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140748',
      abilityTwoName: 'Tectonics',
      abilityTwo:
          'Summon a rock-wall activate again to send the rocks crashing toward the enemy.',
//    abilityThreeImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/f/fd/Petrify130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140625',
      abilityThreeName: 'Petrify',
      abilityThree: 'Fossilize foes with Atlas\' hardened gaze.',
//    abilityFourImage:
//        'https://vignette.wikia.nocookie.net/warframe/images/e/e0/Rumblers130xDark.png/revision/latest/zoom-crop/width/90/height/55?cb=20180121140701',
      abilityFourName: 'Rumblers',
      abilityFour: 'Summon two elemental stone brawlers to the melee.',
      passive: 'Passive',
      passiveBio: 'Becomes immune to knockdown effects while on the ground',
      lore: '''''',
    ),
    Warframe(
      name: 'Chroma Prime',
      image:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages-eds-ssl.xboxlive.com%2Fimage%3Furl%3D8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTc30_x3XUS_XXXyNp.OIMNUTEyMG0nIBTi36PAIVNdXHwlQc..zNF1by4cH9dn5iaAy1TezOvPk9I9Fnp_GlUXO3heohNPpFrHwSo94bjN7W2.oMXZg3ov5mw0ujnKQ3nKOFN5t5FA7BzVNTW0.JvHYQY2av.Sw1bvK76iMXluLpI-%26h%3D1080%26w%3D1920%26format%3Djpg&f=1&nofb=1',
      bio:
          'Bind the elements and unleash untold destruction with Chroma Prime. Featuring altered mod polarities for greater customization.',
      health: 100,
      shield: 105,
      armor: 425,
      energy: 200,
      sprint: 1.00,
//    abilityOneImage: '',
      abilityOneName: 'Special Scream',
      abilityOne:
          'Exhale a deep breath of elemental destruction. Chroma\'s energy color determines the element.',
//    abilityTwoImage: '',
      abilityTwoName: 'Elemental Ward',
      abilityTwo:
          'Depending on Chroma\'s elemental alignment, an offensive area-of-effect is created. Chroma and his nearby allies are imbued with defensive energy.',
//    abilityThreeImage: '',
      abilityThreeName: 'Vex Armor',
      abilityThree:
          'When Shields are hit, Chroma and nearby allies\' Armor grows stronger, when Health takes a hit, Weapon Damage increases. Active for a limited time, maximum increases corresponding to rank.',
//    abilityFourImage: '',
      abilityFourName: 'Effigy',
      abilityFour:
          'Chroma turns his pelt into a massive sentry that strengthens nearby allies and engulfs enemies in elemental attacks.',
      passive: 'Passive',
      passiveBio:
          'Chosen Emissive Color dictates the type of Elemental Damage by Abilities',
      lore: '''''',
    ),
    Warframe(
      name: 'Ember Prime',
      image:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fnews.gvgmall.com%2Fwp-content%2Fuploads%2F2019%2F01%2Fvault1-1024x572.jpg&f=1&nofb=1',
      bio:
          'Ember Prime offers the same potential for wanton destruction as Ember but provides unique mod polarities, allowing for greater customization.',
      health: 100,
      shield: 125,
      armor: 150,
      energy: 150,
      sprint: 1.10,
//    abilityOneImage: '',
      abilityOneName: 'Fireball',
      abilityOne:
          'Charge and release a fiery projectile that ignites enemies on contact.',
//    abilityTwoImage: '',
      abilityTwoName: 'Immolation',
      abilityTwo:
          'Protect Ember with flame armor that burns stronger over time, consuming energy once its meter is at full strength. Cast again to extinguish the flame.',
//    abilityThreeImage: '',
      abilityThreeName: 'Fire Blast',
      abilityThree:
          'Slam the ground to create a wave of incinerating plasma that knocks back enemies and strips their armor.',
//    abilityFourImage: '',
      abilityFourName: 'Inferno',
      abilityFour:
          'Command a flaming comet to crash down in front of ember, engulfing enemies with a fire that can spread through their ranks.',
      passive: 'Passive',
      passiveBio:
          'Receive 5% Ability Strength for every enemy within 50m engulfed in flame.',
      lore: '''''',
    ),
    Warframe(
      name: 'Excalibur',
      image:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pcgamesn.com%2Fwp-content%2Fuploads%2Flegacy%2Fexcalibur_warframe_build.jpg&f=1&nofb=1',
      bio:
          'A perfect balance of mobility and offense, excalibur is the ideal warframe for new players.',
      health: 100,
      shield: 100,
      armor: 225,
      energy: 100,
      sprint: 1.0,
//    abilityOneImage: '',
      abilityOneName: 'Slash Dash',
      abilityOne:
          'Dashing between enemies while slashing with the exalted blade.',
//    abilityTwoImage: '',
      abilityTwoName: 'Radial Blind',
      abilityTwo:
          'Emits a bright flash of light, blinding all enemies in a small radius for several seconds.',
//    abilityThreeImage: '',
      abilityThreeName: 'Radial Javelin',
      abilityThree:
          'Launches javelins towards enemies, dealing high damage and impaling them to walls.',
//    abilityFourImage: '',
      abilityFourName: 'Exalted Blade',
      abilityFour: 'Summon a sword of pure light and immense power.',
      passive: 'Passive',
      passiveBio:
          'Excalibur deals 10% increased damage and attacks 10% faster when wielding swords',
      lore: '''''',
    ),
  ];

  List<Warframe> get items {
    return [..._items];
  }

  Warframe findByName(String name) {
    return _items.firstWhere((war) => war.name == name);
  }
}

const CODEX_ARCHWING = const [
  Archwing(
    name: '',
    image: '',
    bio: '',
  ),
];

const CODEX_PRIMARY = const [
  Primary(
    name: '',
    image: '',
    bio: '',
  ),
];

const CODEX_SECONDARY = const [
  Secondary(
    name: '',
    image: '',
    bio: '',
  )
];

const CODEX_MELEE = const [
  Melee(
    name: '',
    image: '',
    bio: '',
  ),
];
