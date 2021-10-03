part of presentation;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator([this.label = 'GETTING GAME DATA']);

  final String label;

  @override
  Widget build(BuildContext context) {
    const double size = 23.0;
    return Center(
      child: SizedBox(
        height: WarframePlatform.isMobile ? size : size * 2,
        width: WarframePlatform.isMobile ? size : size * 2,
        child: const CircularProgressIndicator(
          color: Color.fromRGBO(255, 255, 255, 0.9),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  const NoData([this.label = 'NO DATA']);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        softWrap: true,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          color: Color.fromRGBO(255, 255, 255, 0.9),
        ),
      ),
    );
  }
}
