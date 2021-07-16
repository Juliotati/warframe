part of presentation;

class StatsText extends StatelessWidget {
  const StatsText(this.data, {Key? key, this.style}) : super(key: key);

  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ??
          const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(0, 0, 0, 1.0),
          ),
    );
  }
}

class StatsTitle extends StatelessWidget {
  const StatsTitle(
    this.label, {
    Key? key,
    this.data,
  }) : super(key: key);

  final String label;
  final String? data;
  @override
  Widget build(BuildContext context) {
    return WarframeContainer(
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      child: Row(
        children: <Widget>[
          Text(label),
          const Spacer(),
          if (data != null) Text(data!),
        ],
      ),
    );
  }
}
