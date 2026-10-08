import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/workout_model.dart';

/// Greeting banner — personalized welcome + date chip + streak pill.
class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date chip + streak pill row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Date chip with live-dot
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                borderRadius: AppRadius.full,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    SampleData.dateLabel,
                    style: AppTextStyles.labelSm(color: AppColors.primaryContainer),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            // Streak pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: AppRadius.full,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${SampleData.streakDays} Days',
                    style: AppTextStyles.labelSm(color: AppColors.secondary)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Personalized greeting
        Text(
          '${SampleData.greeting}, ${SampleData.userName} 👋',
          style: AppTextStyles.headlineLgMobile(),
        ),
        const SizedBox(height: 4),
        Text(
          SampleData.subtitle,
          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}
