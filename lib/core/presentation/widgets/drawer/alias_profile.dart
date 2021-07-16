part of presentation;

class AliasProfile extends StatelessWidget {
  const AliasProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const WarframeContainer(
          showImage: true,
          backgroundImage: kAvatar,
          height: 140,
          horizontalMargin: 8.0,
          verticalMargin: 8.0,
          horizontalPadding: 0.0,
          verticalPadding: 0.0,
          width: 140,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '24',
              style: TextStyle(fontSize: 45),
            ),
            Text(
              'GOLD DRAGON',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 13,
                  ),
            ),
            const Text(
              'blazertherazer12',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ],
    );
  }
}
