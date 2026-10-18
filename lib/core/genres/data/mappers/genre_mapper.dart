import '../../../models/genre.dart';
import '../../domain/entities/genre_entity.dart';

extension GenreMapper on Genre {
  GenreEntity toEntity() => GenreEntity(id: id, name: name);
}

