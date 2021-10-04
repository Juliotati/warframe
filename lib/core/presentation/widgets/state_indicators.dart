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
  const NoData([this.label = 'NO DATA AVAILABLE']);

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

class RetryButton extends StatelessWidget {
  const RetryButton({
    this.buttonLabel = 'Retry',
    this.message = 'No data available for display',
    required this.onTap,
  });

  final String buttonLabel;
  final String message;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NoData(message),
          const SizedBox(height: 10),
          WarframeContainer(
            onTap: onTap,
            width: 140,
            centerChild: true,
            withShadow: true,
            color: const Color.fromRGBO(255, 255, 255, 0.7),
            child: Text(
              buttonLabel,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
