part of presentation;

class StackedContainer extends StatelessWidget {
  const StackedContainer({
    Key? key,
    required this.label,
    required this.image,
    required this.onTap,
    this.fontSize = 16,
    this.height = 197,
    this.maxLines,
    this.bottom = -8.0,
    required this.tag,
    required this.labelTag,
    this.showBackground = false,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String label;
  final String? image;
  final double fontSize;
  final double height;
  final double bottom;
  final int? maxLines;
  final void Function()? onTap;
  final Object tag;
  final Object labelTag;
  final bool showBackground;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color.fromRGBO(255, 255, 255, 0.65);
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          if (showBackground)
            WarframeContainer(
              onTap: onTap,
              withShadow: true,
              height: height,
              margin: 0.0,
              width: double.infinity,
              color: bgColor,
              showImage: true,
              backgroundImage: image ?? kImagePlaceholder,
            ),
          Hero(
            tag: tag,
            child: Material(
              color: const Color.fromRGBO(0, 0, 0, 0.0),
              child: WarframeContainer(
                onTap: onTap,
                withShadow: true,
                height: height,
                margin: 0.0,
                width: double.infinity,
                color: bgColor,
                showImage: true,
                backgroundImage: image ?? kImagePlaceholder,
                fit: fit,
              ),
            ),
          ),
          Positioned(
            bottom: bottom,
            left: 15.0,
            right: 15.0,
            child: Hero(
              tag: labelTag,
              child: Material(
                color: const Color.fromRGBO(0, 0, 0, 0.0),
                child: WarframeContainer(
                  onTap: onTap,
                  margin: 0.0,
                  withShadow: true,
                  width: double.infinity,
                  child: Text(
                    label,
                    softWrap: true,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: fontSize,
                          color: const Color.fromRGBO(0, 0, 0, 1.0),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
