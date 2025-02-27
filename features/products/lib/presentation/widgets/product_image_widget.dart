import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required this.url,
    this.fit,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/$url', package: 'products'),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
