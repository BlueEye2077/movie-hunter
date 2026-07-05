import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class PersonBiography extends StatefulWidget {
  final String biography;

  const PersonBiography({super.key, required this.biography});

  @override
  State<PersonBiography> createState() => _PersonBiographyState();
}

class _PersonBiographyState extends State<PersonBiography> {
  bool _isExpanded = false;
  static const int _collapsedMaxLines = 4;

  @override
  Widget build(BuildContext context) {
    final isBiographyEmpty = widget.biography.trim().isEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TextStyles.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Biography',
            style: TextStyles.font16SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          SizedBox(height: 8.h),
          isBiographyEmpty
              ? Text(
                  "No biography available.",
                  style: TextStyles.font14Regular.copyWith(
                    color: AppColors.textDarkGrey,
                    height: 1.6,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.biography,
                      maxLines: _isExpanded ? null : _collapsedMaxLines,
                      overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                      style: TextStyles.font14Regular.copyWith(
                        color: AppColors.textGrey,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Text(
                        _isExpanded ? 'Show less' : 'Read more',
                        style: TextStyles.font14Medium.copyWith(
                          color: AppColors.primaryBlueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
