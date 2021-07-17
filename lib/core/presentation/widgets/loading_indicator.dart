part of presentation;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator([this.label = 'GETTING GAME DATA']);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ),
          const SizedBox(height: 15),
          Text(label),
        ],
      ),
    );
  }
}
