import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;

  const AppLogo({
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/scoutasks.png',
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }
}
