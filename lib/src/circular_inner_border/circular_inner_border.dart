import 'package:flutter/material.dart';

class CircularProfile extends StatelessWidget {
  const CircularProfile({
    Key? key,
    required this.image,
    this.backgroundColor,
    this.borderColor,
    this.borderThickness = 3,
    this.radius,
    this.onTap,
  }) : super(key: key);
  final ImageProvider<Object> image;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderThickness;
  final double? radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: radius != null ? radius! * 2 : size.width * 0.16,
        height: radius != null ? radius! * 2 : size.width * 0.16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: backgroundColor ??
                  Theme.of(context).primaryColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.white.withOpacity(0.5),
              width: borderThickness,
            ),
          ),
        ),
      ),
    );
  }
}
