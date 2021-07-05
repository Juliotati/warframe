part of utilities;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator([this.label = 'GETTING GAME DATA']);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
        ),
        const SizedBox(height: 15),
        Text(label),
      ],
    );
  }
}
