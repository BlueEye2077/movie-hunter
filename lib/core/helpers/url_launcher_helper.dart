import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theming/app_strings.dart';
import '../theming/colors.dart';

/// Launches [urlString] in an external application, surfacing a SnackBar on failure.
Future<void> launchExternalUrl(
  BuildContext context,
  String urlString, {
  String errorMessage = AppStrings.couldNotLaunchUrl,
}) async {
  final uri = Uri.tryParse(urlString);
  bool launched = false;

  if (uri != null) {
    try {
      launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      launched = false;
    }
  }

  if (!launched && context.mounted) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: AppColors.secondaryRed,
        ),
      );
  }
}
