import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget? errorWidget;

  const CustomImageWidget({
    super.key,
    this.imageUrl,
    this.width = 60,
    this.height = 60,
    this.fit = BoxFit.contain,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          imageUrl ??
          'https://explosivewhey.com/cdn/shop/articles/best-workout-routine-for-gym-beginners-135325.png?v=1738755379&width=2048',
      width: width,
      height: height,
      fit: fit,
      errorWidget: (context, url, error) =>
          errorWidget ??
          Image.asset(
            "assets/images/no-image.jpg",
            fit: fit,
            width: width,
            height: height,
          ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
