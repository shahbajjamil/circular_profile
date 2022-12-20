import 'package:flutter/material.dart';

class CircularProfile extends StatelessWidget {
  const CircularProfile({
    Key? key,
    required this.image,
    this.backgroundColor,
    this.innerBorderColor,
    this.borderThickness,
    this.radius = 40,
    this.onTap,
    this.showShadow = true,
    this.customShadow,
  }) : super(key: key);
  final ImageProvider<Object> image;
  final Color? backgroundColor;
  final Color? innerBorderColor;
  final double? borderThickness;
  final double radius;
  final VoidCallback? onTap;
  final bool showShadow;
  final List<BoxShadow>? customShadow;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // print("${radius * 0.13}");

    return InkWell(
      onTap: onTap,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: showShadow
              ? customShadow ??
                  [
                    BoxShadow(
                      color: backgroundColor ??
                          Theme.of(context).primaryColor.withOpacity(0.5),
                      spreadRadius: radius * 0.1,
                      blurRadius: radius * 0.3,
                      offset: const Offset(0, 0),
                    ),
                  ]
              : null,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: innerBorderColor ?? Colors.white.withOpacity(0.5),
              width: borderThickness ?? radius * 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
