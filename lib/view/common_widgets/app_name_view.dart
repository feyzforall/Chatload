import 'package:chatload/constants/app_colors.dart';
import 'package:chatload/constants/app_strings.dart';
import 'package:flutter/material.dart';

enum AppNameType { appbar, body }

/// If the app name will be used in the [AppBar], [AppNameType]
/// will be selected as [AppNameType.appbar], if it will be used in screens
/// (like splash screen) it will be selected as [AppNameType.body]

class AppNameView extends StatelessWidget {
  const AppNameView({
    super.key,
    this.appNameType = AppNameType.appbar,
  });

  final AppNameType appNameType;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.chat,
        style: appNameType == AppNameType.body
            ? Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.frenchPass,
                  fontWeight: FontWeight.bold,
                )
            : Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.frenchPass,
                ),
        children: const [
          TextSpan(
            text: AppStrings.load,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    // );
  }
}
