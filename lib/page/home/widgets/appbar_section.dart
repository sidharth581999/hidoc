
import 'package:flutter/material.dart';
import 'package:movie/config/app_colors.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Browse",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: AppConfig.white),
            ),
            Text(
              "Movie",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppConfig.white),
            ),
          ],
        ),
        const Icon(Icons.menu, size: 22, color: AppConfig.white),
      ],
    );
  }
}
