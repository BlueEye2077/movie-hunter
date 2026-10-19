import '../../../home/domain/entities/movie_entity.dart';

class CategoryEntity {
  final int id;
  final String name;
  final String imageUrl;
  final List<MovieEntity> initialMovies;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.initialMovies,
  });
}
