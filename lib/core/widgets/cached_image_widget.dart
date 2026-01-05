import 'package:flutter/material.dart';
import '../services/image_cache_service.dart';

/// Production-ready Cached Image Widget
///
/// PURPOSE:
/// - Shimmer placeholder
/// - Clean error widget
/// - Fully responsive for mobile & tablet
class CachedImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CachedImageWidget({super.key, 
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ImageCacheService().loadNetworkImage(
      url: url,
      width: width,
      height: height,
      fit: fit,
      context: context, // required for prefetch/tablet scaling
    );
  }
}
