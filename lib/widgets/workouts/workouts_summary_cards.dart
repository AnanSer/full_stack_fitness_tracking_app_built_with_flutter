import 'package:flutter/material.dart';
import '../../models/workout_model.dart';
import '../../theme/app_theme.dart';

/// 3-pillar glanceable metric summary: Workouts, Total Time, Streak
class WorkoutsSummaryCards extends StatelessWidget {
  const WorkoutsSummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = SampleData.workoutsWeekStats;

    return Row(
      children: [
        // Card 1: Completed sessions
        Expanded(
          child: _SummaryPillar(
            label: 'WORKOUTS',
            icon: Icons.check_circle_rounded,
            iconColor: AppColors.primaryContainer,
            iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.15),
            glowColor: AppColors.primaryContainer.withValues(alpha: 0.05),
            valueWidget: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${stats.completedSessions} ',
                    style: AppTextStyles.headlineMd()
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: 'done',
                    style: AppTextStyles.labelMd(
                        color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            footerWidget: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Goal: ${stats.goalSessions}/wk',
                    style: AppTextStyles.labelSm(
                        color: AppColors.primaryContainer),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Card 2: Total Time
        Expanded(
          child: _SummaryPillar(
            label: 'TOTAL TIME',
            icon: Icons.schedule_rounded,
            iconColor: AppColors.tertiaryContainer,
            iconBgColor: AppColors.tertiaryContainer.withValues(alpha: 0.15),
            glowColor: AppColors.tertiaryContainer.withValues(alpha: 0.05),
            valueWidget: Text(
              stats.totalTime,
              style: AppTextStyles.headlineMd()
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            footerWidget: Row(
              children: [
                const Icon(
                  Icons.trending_up_rounded,
                  size: 13,
                  color: AppColors.tertiaryContainer,
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    stats.timeVsLastWeek,
                    style: AppTextStyles.labelSm(
                        color: AppColors.tertiaryContainer),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Card 3: Streak
        Expanded(
          child: _SummaryPillar(
            label: 'STREAK',
            icon: Icons.local_fire_department_rounded,
            iconColor: AppColors.secondary,
            iconBgColor: AppColors.secondaryContainer.withValues(alpha: 0.3),
            glowColor: AppColors.secondary.withValues(alpha: 0.05),
            valueWidget: Text(
              '${stats.streakDays}d 🔥',
              style: AppTextStyles.headlineMd(color: AppColors.secondary)
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            footerWidget: Text(
              'Best: ${stats.bestStreakDays} days',
              style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryPillar extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color glowColor;
  final Widget valueWidget;
  final Widget footerWidget;

  const _SummaryPillar({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.glowColor,
    required this.valueWidget,
    required this.footerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.md,
      ),
      child: ClipRRect(
        borderRadius: AppRadius.md,
        child: Stack(
          children: [
            // Ambient corner glow
            Positioned(
              right: -8,
              bottom: -8,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: glowColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: AppTextStyles.labelSm(
                          color: AppColors.onSurfaceVariant,
                        ).copyWith(
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: iconBgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, size: 14, color: iconColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  valueWidget,
                  const SizedBox(height: 4),
                  footerWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
