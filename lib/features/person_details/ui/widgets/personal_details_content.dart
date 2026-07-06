import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/movie.dart';
import '../../data/models/person_details_response.dart';
import 'person_biography.dart';
import 'person_info_header.dart';
import 'person_known_for_section.dart';

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
