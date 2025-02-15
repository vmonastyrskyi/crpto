import 'package:crpto/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CRPTOSearchBar extends StatelessWidget {
  const CRPTOSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
  });

  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      constraints: const BoxConstraints(),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(4.0)),
      backgroundColor: const WidgetStatePropertyAll(AppColors.widgetBackgroundColor),
      shadowColor: const WidgetStatePropertyAll(AppColors.shadowColor),
      elevation: const WidgetStatePropertyAll(1.0),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 14.0,
        ),
      ),
      hintStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.hintTextColor,
          fontSize: 14.0,
        ),
      ),
      leading: const Padding(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 4.0, 0.0),
        child: Icon(
          size: 20.0,
          color: AppColors.iconColor,
          Icons.search,
        ),
      ),
      hintText: hintText,
    );
  }
}
