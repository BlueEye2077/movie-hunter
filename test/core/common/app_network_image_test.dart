import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_hunter/core/common/app_network_image.dart';

void main() {
  group('AppNetworkImage Widget Tests', () {
    testWidgets('renders CachedNetworkImage with correct properties on native', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppNetworkImage(
              imageUrl: 'https://example.com/test.jpg',
              width: 100,
              height: 150,
              fit: BoxFit.cover,
              memCacheWidth: 200,
              memCacheHeight: 300,
            ),
          ),
        ),
      );

      final cachedImageFinder = find.byType(CachedNetworkImage);
      expect(cachedImageFinder, findsOneWidget);

      final cachedImage = tester.widget<CachedNetworkImage>(cachedImageFinder);
      expect(cachedImage.imageUrl, equals('https://example.com/test.jpg'));
      expect(cachedImage.width, equals(100));
      expect(cachedImage.height, equals(150));
      expect(cachedImage.fit, equals(BoxFit.cover));
      expect(cachedImage.memCacheWidth, equals(200));
      expect(cachedImage.memCacheHeight, equals(300));
    });

    testWidgets('renders custom placeholder when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppNetworkImage(
              imageUrl: 'https://example.com/test.jpg',
              placeholder: (context) => const Text('Loading...'),
            ),
          ),
        ),
      );

      final cachedImageFinder = find.byType(CachedNetworkImage);
      expect(cachedImageFinder, findsOneWidget);

      final cachedImage = tester.widget<CachedNetworkImage>(cachedImageFinder);
      expect(cachedImage.placeholder, isNotNull);
    });

    testWidgets('renders custom errorWidget when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppNetworkImage(
              imageUrl: 'https://example.com/test.jpg',
              errorWidget: (context, error) => const Text('Error!'),
            ),
          ),
        ),
      );

      final cachedImageFinder = find.byType(CachedNetworkImage);
      expect(cachedImageFinder, findsOneWidget);

      final cachedImage = tester.widget<CachedNetworkImage>(cachedImageFinder);
      expect(cachedImage.errorBuilder, isNotNull);
    });
  });
}
