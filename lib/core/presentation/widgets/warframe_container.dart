part of presentation;

class WarframeContainer extends StatelessWidget {
  const WarframeContainer({
    Key? key,
    this.withShadow = false,
    this.height,
    this.child,
    this.width,
    this.centerChild = false,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 12.0,
    this.horizontalMargin = 12.0,
    this.verticalMargin = 12.0,
    this.radius = 10.0,
    this.color = const Color.fromRGBO(255, 255, 255, 1.0),
    this.showImage = false,
    this.fit = BoxFit.cover,
    this.backgroundImage,
    this.onTap,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double verticalPadding;
  final double verticalMargin;
  final double horizontalPadding;
  final double horizontalMargin;
  final bool showImage;
  final double radius;
  final Color? color;
  final bool withShadow;
  final bool centerChild;
  final String? backgroundImage;
  final Widget? child;
  final BoxFit fit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const BorderRadius _radius = BorderRadius.all(Radius.circular(10.0));
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      child: InkWell(
        splashColor: const Color.fromRGBO(0, 0, 0, 1.0),
        onTap: onTap,
        borderRadius: _radius,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: _radius,
            image: showImage
                ? DecorationImage(
                    image: NetworkImage(backgroundImage!),
                    fit: fit,
                  )
                : null,
            boxShadow: withShadow
                ? const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.10),
                      blurRadius: 10.0,
                    ),
                  ]
                : null,
          ),
          child: Align(
            alignment: centerChild ? Alignment.center : Alignment.centerLeft,
            child: child,
          ),
        ),
      ),
    );
  }
}
