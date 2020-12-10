import 'package:flutter/foundation.dart';

class NewsCard with ChangeNotifier {
  final String title;
  final String image;
  final String webPage;

  NewsCard({
    this.title,
    this.image,
    this.webPage,
  });
}

class News with ChangeNotifier {
  List<NewsCard> _cards = [
    NewsCard(
        title: 'TENNOCON 2020 ANNOUNCEMENT Digital Event moved to August 1',
        image:
            'https://n9e5v4d8.ssl.hwcdn.net/uploads/thumbnails/4c88b4e1c0645332814c62e624048bf8_845x230.jpg',
        webPage: 'https://www.warframe.com/news/tennocon-2020-announcement-en'),
    NewsCard(
        title: 'Trinity Prime & Nova Prime are back!',
        image:
            'https://n9e5v4d8.ssl.hwcdn.net/uploads/d73ee283b793d2cd8251274f4983acbb.jpg',
        webPage: 'https://www.warframe.com/news/trinity-and-nova-prime-vault'),
    NewsCard(
        title: 'Design official merch for tennocon 2020!',
        image:
            'https://n9e5v4d8.ssl.hwcdn.net/uploads/55109b8f244183456f930719caac41d3.jpg',
        webPage:
            'https://www.warframe.com/news/tennocon-2020-design-challenge'),
    NewsCard(
      title: 'Free Prime armor set with twitch prime!',
      image:
          'https://n9e5v4d8.ssl.hwcdn.net/uploads/thumbnails/73b995d151e955ab45f13788e1ca3066_845x230.jpg',
      webPage:
          'https://www.warframe.com/news/get-the-avia-prime-armor-set-with-twitch-prime',
    ),
    NewsCard(
      title: 'Tennocon 2020 packs available now',
      image:
          'https://n9e5v4d8.ssl.hwcdn.net/uploads/19035151db7e4e484efef9a4b33dc978.jpg',
      webPage:
          'https://www.warframe.com/news/tennocon-2020-packs-available-now',
    ),
    NewsCard(
      title: 'NIGHTWAVE: SERIES 3 — THE GLASSMAKER',
      image:
          'https://n9e5v4d8.ssl.hwcdn.net/uploads/623c9a7fd5d21c0d5ace78b393be380a.jpg',
      webPage:
          'https://www.warframe.com/news/nightwave-series-3-the-glassmaker',
    ),
    NewsCard(
      title: 'Titania Prime access available now',
      image:
          'https://content.invisioncic.com/Mwarframe/monthly_2020_03/TitaniaPrime.thumb.png.90d481cfdfac7d77f842524138274a00.png',
      webPage:
          'https://forums.warframe.com/topic/1178179-titania-prime-access-is-live/',
    ),
    NewsCard(
      title: 'Renown pack xviii available now',
      image:
          'https://content.invisioncic.com/Mwarframe/monthly_2020_03/WF_RenownPackXVIII_SM_1920x1080.jpg.819ed812a6ba9e62dfa69f02c1917460.jpg',
      webPage: 'https://forums.warframe.com/topic/1174433-renown-pack-xviii/',
    ),
  ];

  List<NewsCard> get cards {
    return [..._cards];
  }
}
