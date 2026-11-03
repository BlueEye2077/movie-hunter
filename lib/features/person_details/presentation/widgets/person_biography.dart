import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class PersonBiography extends StatelessWidget {
  final String biography;

  const PersonBiography({super.key, required this.biography});

  @override
  Widget build(BuildContext context) {
    final isBiographyEmpty = biography.trim().isEmpty;

    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.biography,
            style: TextStyles.font16SemiBold.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          SizedBox(height: 8.h),
          isBiographyEmpty
              ? Text(
                  AppStrings.noBiography,
                  style: TextStyles.font14Regular.copyWith(
                    color: AppColors.textDarkGrey,
                    height: 1.6,
                  ),
                )
              : _ExpandableText(text: biography),
        ],
      ),
    );
  }
}

/// Collapsible text that only shows the "Read more" toggle when the text
/// actually overflows [_collapsedMaxLines].
class _ExpandableText extends StatefulWidget {
  final String text;

  const _ExpandableText({required this.text});

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  static const int _collapsedMaxLines = 4;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final style = TextStyles.font14Regular.copyWith(
      color: AppColors.textGrey,
      height: 1.6,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: widget.text, style: style),
          maxLines: _collapsedMaxLines,
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout(maxWidth: constraints.maxWidth);
        final isOverflowing = painter.didExceedMaxLines;
        painter.dispose();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              maxLines: _isExpanded ? null : _collapsedMaxLines,
              overflow: _isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: style,
            ),
            if (isOverflowing) ...[
              SizedBox(height: 4.h),
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Text(
                  _isExpanded ? AppStrings.showLess : AppStrings.readMore,
                  style: TextStyles.font14Medium.copyWith(
                    color: AppColors.primaryBlueAccent,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

