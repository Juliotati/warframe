part of presentation;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator([this.label = 'GETTING GAME DATA']);

  final String label;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 23,
        width: 23,
        child: CircularProgressIndicator(
          color: Color.fromRGBO(255, 255, 255, 0.9),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }
}
