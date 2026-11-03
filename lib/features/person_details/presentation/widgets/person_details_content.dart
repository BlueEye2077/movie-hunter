import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/person_details_entity.dart';
import 'person_biography.dart';
import 'person_info_header.dart';
import 'person_known_for_section.dart';

class PersonDetailsContent extends StatelessWidget {
  final PersonDetailsEntity person;

  const PersonDetailsContent({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          // Avatar, name, department, birthday, age, place of birth
          PersonInfoHeader(person: person),
          SizedBox(height: 28.h),
          // Expandable biography
          PersonBiography(biography: person.biography),
          SizedBox(height: 28.h),
          // Known For movies carousel
          PersonKnownForSection(
            knownFor: person.knownFor,
            allMovies: person.allMovies,
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

