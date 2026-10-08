import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/workout_model.dart';

/// Hero card showing today's scheduled workout with quick-metric strip and CTA.
class TodayWorkoutCard extends StatelessWidget {
  const TodayWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = SampleData.todayWorkout;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.xl, // rounded-3xl
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryContainer.withValues(alpha: 0.07),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.xl,
        child: Stack(
          children: [
            // Ambient glow backdrops (top-right and bottom-left)
            Positioned(
              right: -48,
              top: -48,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryContainer.withValues(alpha: 0.07),
                ),
              ),
            ),
            Positioned(
              left: -32,
              bottom: -32,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryContainer.withValues(alpha: 0.1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Focus tag + Preview button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer.withValues(alpha: 0.13),
                          borderRadius: AppRadius.full,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.fitness_center_rounded,
                                size: 14, color: AppColors.primaryContainer),
                            const SizedBox(width: 5),
                            Text(
                              w.focusTag,
                              style: AppTextStyles.labelMd(
                                      color: AppColors.primaryContainer)
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('Preview',
                              style: AppTextStyles.labelMd(
                                  color: AppColors.onSurfaceVariant)),
                          const Icon(Icons.chevron_right_rounded,
                              size: 16, color: AppColors.onSurfaceVariant),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Workout title
                  Text(w.title, style: AppTextStyles.headlineMd()),
                  const SizedBox(height: 4),
                  Text(
                    w.description,
                    style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // 4-metric pill strip
                  Row(
                    children: [
                      _MetricPill(
                          icon: Icons.format_list_numbered_rounded,
                          iconColor: AppColors.primaryContainer,
                          value: '${w.exerciseCount}',
                          label: 'Exercises'),
                      const SizedBox(width: 8),
                      _MetricPill(
                          icon: Icons.schedule_rounded,
                          iconColor: AppColors.tertiaryContainer,
                          value: '${w.durationMinutes}',
                          label: 'Mins'),
                      const SizedBox(width: 8),
                      _MetricPill(
                          icon: Icons.bolt_rounded,
                          iconColor: AppColors.secondary,
                          value: w.intensity,
                          label: 'Intensity'),
                      const SizedBox(width: 8),
                      _MetricPill(
                          icon: Icons.local_fire_department_rounded,
                          iconColor: AppColors.secondary,
                          value: '~${w.kcalEstimate}',
                          label: 'Kcal'),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Optimal window strip
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: AppRadius.lg,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.timer_outlined,
                            size: 14, color: AppColors.primaryContainer),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            w.optimalWindow,
                            style: AppTextStyles.labelSm(
                                color: AppColors.primaryContainer),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Start Workout CTA
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryContainer,
                        foregroundColor: AppColors.onPrimary,
                        shape: const StadiumBorder(),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        textStyle: AppTextStyles.titleMd(
                                color: AppColors.onPrimary)
                            .copyWith(fontWeight: FontWeight.w700),
                      ).copyWith(
                        overlayColor: WidgetStateProperty.all(
                            AppColors.onPrimary.withValues(alpha: 0.08)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_rounded, size: 24),
                      label: const Text('Start Workout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _MetricPill({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: AppRadius.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 17, color: iconColor),
            const SizedBox(height: 4),
            Text(value,
                style: AppTextStyles.labelLg()
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 1),
            Text(label,
                style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
