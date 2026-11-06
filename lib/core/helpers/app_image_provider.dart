import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ImageProvider appImageProvider(
  String imageUrl, {
  int? maxWidth,
  int? maxHeight,
}) {
  if (kIsWeb) {
    final provider = NetworkImage(imageUrl);
    if (maxWidth != null || maxHeight != null) {
      return ResizeImage(provider, width: maxWidth, height: maxHeight);
    }
    return provider;
  }

  final provider = CachedNetworkImageProvider(imageUrl);
  if (maxWidth != null || maxHeight != null) {
    return ResizeImage(provider, width: maxWidth, height: maxHeight);
  }
  return provider;
}
