part of warframe_news;

class WebviewControl extends StatelessWidget {
  const WebviewControl({
    Key? key,
    this.label,
    required this.icon,
    this.hideLabel = false,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final IconData icon;
  final bool hideLabel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      centerChild: true,
      horizontalMargin: 6.0,
      horizontalPadding: 10.0,
      verticalPadding: 0.0,
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(icon),
          if (label != null || hideLabel) Text(label!),
        ],
      ),
    );
  }
}
