part of presentation;

class WarframeContainer extends StatefulWidget {
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
  _WarframeContainerState createState() => _WarframeContainerState();
}

class _WarframeContainerState extends State<WarframeContainer> {
  @override
  Widget build(BuildContext context) {
    final BorderRadius _radius = BorderRadius.all(
      Radius.circular(widget.radius),
    );
    String? _backgroundImage() {
      if (widget.showImage &&
          widget.backgroundImage!.startsWith(
            DeadLink.baseUrl,
          )) {
        return kImagePlaceholder;
      }
      return widget.backgroundImage;
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.horizontalMargin,
        vertical: widget.verticalMargin,
      ),
      child: InkWell(
        splashColor: const Color.fromRGBO(0, 0, 0, 1.0),
        onTap: widget.onTap,
        borderRadius: _radius,
        child: Container(
          height: widget.height,
          width: widget.width,
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
            vertical: widget.verticalPadding,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: _radius,
            image: !widget.showImage
                ? null
                : DecorationImage(
                    image: NetworkImage(_backgroundImage()!),
                    fit: widget.fit,
                  ),
            boxShadow: !widget.withShadow
                ? null
                : const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.10),
                      blurRadius: 10.0,
                    ),
                  ],
          ),
          child: Align(
            alignment:
                widget.centerChild ? Alignment.center : Alignment.centerLeft,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
