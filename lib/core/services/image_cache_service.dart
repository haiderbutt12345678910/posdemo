import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../extensions/context_extensions.dart';

/// Production-ready Image Caching Service
///
/// PURPOSE:
/// - Centralizes image caching and prefetching logic
/// - Improves app performance & perceived speed
/// - Handles placeholders, errors, and tablet scaling
class ImageCacheService {
  /// Loads an image with shimmer placeholder and error widget
  Widget loadNetworkImage({
    required String url,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    required BuildContext context,
  }) {
    final imageWidth = width ?? context.width;
    final imageHeight = height ?? context.width * 0.5; // fallback ratio

    return CachedNetworkImage(
      imageUrl: url,
      width: imageWidth,
      height: imageHeight,
      fit: fit,
      placeholder: (context, url) => _buildShimmer(imageWidth, imageHeight),
      errorWidget: (context, url, error) => _buildErrorWidget(imageWidth, imageHeight),
    );
  }

  /// Prefetches image to memory cache
  ///
  /// Tablet-aware: you can scale image size depending on device width
  Future<void> prefetch(String url, BuildContext context) async {
    final provider = CachedNetworkImageProvider(url);

    /// Precache image using context for proper device pixel ratio
    await precacheImage(provider, context);
  }

  /// Shimmer placeholder
  Widget _buildShimmer(double width, double height) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F7),
      child: Container(
        width: width,
        height: height,
        color: const Color(0xFFE0E0E0),
      ),
    );
  }

  /// Clean, meaningful error widget
  Widget _buildErrorWidget(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFF5F5F7),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.broken_image,
            color: Color(0xFF9E9E9E),
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            "Image not available",
            style: TextStyle(color: Color(0xFF9E9E9E)),
          ),
        ],
      ),
    );
  }
}
