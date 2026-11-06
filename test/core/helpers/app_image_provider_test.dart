import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_hunter/core/helpers/app_image_provider.dart';

void main() {
  group('appImageProvider', () {
    test('returns CachedNetworkImageProvider on native platforms without resize', () {
      final provider = appImageProvider('https://example.com/image.jpg');
      expect(provider, isA<CachedNetworkImageProvider>());
      final cachedProvider = provider as CachedNetworkImageProvider;
      expect(cachedProvider.url, equals('https://example.com/image.jpg'));
    });

    test('wraps with ResizeImage when maxWidth is specified', () {
      final provider = appImageProvider(
        'https://example.com/image.jpg',
        maxWidth: 200,
      );
      expect(provider, isA<ResizeImage>());
      final resizeImage = provider as ResizeImage;
      expect(resizeImage.width, equals(200));
      expect(resizeImage.imageProvider, isA<CachedNetworkImageProvider>());
    });

    test('wraps with ResizeImage when maxHeight is specified', () {
      final provider = appImageProvider(
        'https://example.com/image.jpg',
        maxHeight: 300,
      );
      expect(provider, isA<ResizeImage>());
      final resizeImage = provider as ResizeImage;
      expect(resizeImage.height, equals(300));
    });
  });
}
