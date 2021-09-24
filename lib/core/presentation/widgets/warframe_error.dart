part of presentation;

class WarframeError extends StatelessWidget {
  const WarframeError([this.message = 'NO DATA AVAILABLE']);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
