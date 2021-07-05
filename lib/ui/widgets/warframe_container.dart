import 'package:flutter/material.dart';

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
    this.margin = 12.0,
    this.radius = 10.0,
    this.color = const Color.fromRGBO(255, 255, 255, 1.0),
    this.showImage = false,
    this.backgroundImage,
    this.onTap,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double verticalPadding;
  final double horizontalPadding;
  final double margin;
  final bool showImage;
  final double radius;
  final Color? color;
  final bool withShadow;
  final bool centerChild;
  final String? backgroundImage;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const BorderRadius _radius = BorderRadius.all(Radius.circular(10.0));
    return Container(
      margin: EdgeInsets.all(margin),
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
                    fit: BoxFit.cover,
                  )
                : null,
            boxShadow: withShadow
                ? const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 30.0,
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
