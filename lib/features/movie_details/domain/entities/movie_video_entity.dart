enum VideoSite {
  youTube,
  other,
}

enum VideoType {
  trailer,
  teaser,
  clip,
  featurette,
  behindTheScenes,
  other,
}

class MovieVideoEntity {
  final String id;
  final String name;
  final String key;
  final VideoSite site;
  final VideoType type;
  final bool isOfficial;

  const MovieVideoEntity({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.isOfficial,
  });
}

