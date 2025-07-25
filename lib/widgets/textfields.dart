
import 'package:flutter/material.dart';
import 'package:movie/config/app_colors.dart';

class CustomSerchBox extends StatelessWidget {
  const CustomSerchBox({
    super.key,
    required this.searchController,
    required this.hint,
    required this.prefix,
    required this.fillColor,
    required this.onSubmit
  });

  final TextEditingController searchController;
  final String hint;
  final Icon? prefix;
  final Color? fillColor; 
  final ValueChanged<String>? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onFieldSubmitted: onSubmit,
      
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(color: AppConfig.greyLoginDesColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: AppConfig.greyLoginDesColor),
        contentPadding: EdgeInsets.zero,
        prefixIcon: prefix,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            style: BorderStyle.none,
            color: AppConfig.blackLight,
          ),
        ),
      ),
    );
  }
}
