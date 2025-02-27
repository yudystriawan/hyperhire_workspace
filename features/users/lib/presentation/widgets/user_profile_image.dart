import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
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
      image: AssetImage('assets/images/$url', package: 'users'),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
