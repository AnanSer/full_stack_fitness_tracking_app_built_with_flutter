import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/workout_model.dart';

/// 3-column stat grid — Workouts Done, Active Streak, Time Active.
class MonthlySnapshotSection extends StatelessWidget {
  const MonthlySnapshotSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = SampleData.monthlyStats;
    return Column(
      children: [
        // Section header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Monthly Snapshot', style: AppTextStyles.titleLg()),
            Text(
              'October 2024',
              style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Stat card grid
        Row(
          children: [
            Expanded(
              child: _StatCard(
                iconData: Icons.verified_rounded,
                iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.13),
                iconColor: AppColors.primaryContainer,
                badgeText: '+${stats.workoutsDelta}',
                badgeColor: AppColors.primaryContainer,
                value: '${stats.workoutsDone}',
                label: 'Workouts done',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatCard(
                iconData: Icons.local_fire_department_rounded,
                iconBgColor: AppColors.secondaryContainer.withValues(alpha: 0.18),
                iconColor: AppColors.secondary,
                badgeText: 'Best ${stats.bestStreakDays}',
                badgeColor: AppColors.secondary,
                value: '${stats.activeStreakDays}',
                valueSuffix: ' Days',
                label: 'Active streak',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _StatCard(
                iconData: Icons.timer_outlined,
                iconBgColor: AppColors.tertiaryContainer.withValues(alpha: 0.13),
                iconColor: AppColors.tertiaryContainer,
                badgeText: '${stats.timeActivePercent}%',
                badgeColor: AppColors.tertiary,
                value: '${stats.timeActiveHours}',
                valueSuffix: 'h',
                label: 'Time active',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData iconData;
  final Color iconBgColor;
  final Color iconColor;
  final String badgeText;
  final Color badgeColor;
  final String value;
  final String? valueSuffix;
  final String label;

  const _StatCard({
    required this.iconData,
    required this.iconBgColor,
    required this.iconColor,
    required this.badgeText,
    required this.badgeColor,
    required this.value,
    this.valueSuffix,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.xl, // rounded-3xl
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon circle + badge row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, size: 17, color: iconColor),
              ),
              Text(
                badgeText,
                style: AppTextStyles.labelSm(color: badgeColor)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Big metric value
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: AppTextStyles.headlineMd()
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                if (valueSuffix != null)
                  TextSpan(
                    text: valueSuffix,
                    style: AppTextStyles.labelMd(
                        color: AppColors.onSurfaceVariant),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
