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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // chat of chatload
        Text(
          AppStrings.chat,
          style: appNameType == AppNameType.body
              ? Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.frenchPass,
                    fontWeight: FontWeight.bold,
                  )
              : Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.frenchPass,
                    fontWeight: FontWeight.bold,
                  ),
        ),
        // load of chatload
        Text(
          AppStrings.load,
          style: appNameType == AppNameType.body
              ? Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
              : Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
        ),
      ],
    );
  }
}
