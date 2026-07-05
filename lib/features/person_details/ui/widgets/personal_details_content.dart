import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hunter/features/home/data/models/movie.dart';
import 'package:movie_hunter/features/person_details/data/models/person_details_response.dart';
import 'package:movie_hunter/features/person_details/ui/widgets/person_biography.dart';
import 'package:movie_hunter/features/person_details/ui/widgets/person_known_for_section.dart';
import 'package:movie_hunter/features/person_details/ui/widgets/person_info_header.dart';

class PersonDetailsContent extends StatelessWidget {
  final PersonDetailsResponse person;

  const PersonDetailsContent({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final cast = person.movieCredits?.cast ?? [];
    final crew = person.movieCredits?.crew ?? [];

    // Combine and remove duplicates based on movie id
    final allMovies = [...cast, ...crew];
    final Map<int, Movie> uniqueMovies = {};
    for (var movie in allMovies) {
      if (movie.id != null) {
        uniqueMovies[movie.id!] = movie;
      }
    }
    final movies = uniqueMovies.values.toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          // Avatar, name, department, birthday, place of birth
          PersonInfoHeader(person: person),
          SizedBox(height: 28.h),
          // Expandable biography
          PersonBiography(biography: person.biography ?? ''),
          SizedBox(height: 28.h),
          // Known For movies carousel
          PersonKnownForSection(movies: movies),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
