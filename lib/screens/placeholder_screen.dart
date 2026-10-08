import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Placeholder screen used for Workouts, Exercises, and Profile tabs.
/// These screens will be implemented in future iterations.
class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: AppColors.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.headlineMd(
                  color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon',
              style: AppTextStyles.bodyMd(color: AppColors.outline),
            ),
          ],
        ),
      ),
    );
  }
}
