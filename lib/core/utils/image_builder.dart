import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({Key? key, required this.imageUrl, required this.fit})
      : super(key: key);

  final String imageUrl;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      // cacheManager: ImageCacheManager,
      alignment: Alignment.center,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
    );
  }
}
