part of presentation;

class WarframeError extends StatelessWidget {
  const WarframeError([this.message]);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message ?? 'Found no warframes'),
    );
  }
}
