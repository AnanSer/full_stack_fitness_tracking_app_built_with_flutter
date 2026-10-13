import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../theme/app_theme.dart';

/// 3-column fitness overview stats row: Workouts, Streak, Total Time.
class ProfileStatsRow extends StatelessWidget {
  final UserProfile profile;

  const ProfileStatsRow({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Stat 1: Workouts Done
        Expanded(
          child: _StatCard(
            icon: Icons.fitness_center_rounded,
            iconColor: AppColors.primaryContainer,
            iconBgColor: AppColors.primaryContainer.withValues(alpha: 0.15),
            badgeText: 'Done',
            badgeColor: AppColors.primaryContainer,
            valueWidget: Text(
              '${profile.totalWorkouts}',
              style: AppTextStyles.headlineMd().copyWith(
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
            ),
            label: 'Workouts',
          ),
        ),
        const SizedBox(width: 10),
        // Stat 2: Active Streak
        Expanded(
          child: _StatCard(
            icon: Icons.local_fire_department_rounded,
            iconColor: AppColors.secondary,
            iconBgColor: AppColors.secondaryContainer.withValues(alpha: 0.3),
            badgeText: 'Active',
            badgeColor: AppColors.secondary,
            valueWidget: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${profile.streakDays}',
                    style: AppTextStyles.headlineMd().copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: 'd',
                    style: AppTextStyles.headlineMd(
                      color: AppColors.secondary,
                    ).copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            label: 'Best: ${profile.bestStreakDays} days',
          ),
        ),
        const SizedBox(width: 10),
        // Stat 3: Total Time
        Expanded(
          child: _StatCard(
            icon: Icons.timer_outlined,
            iconColor: AppColors.tertiaryContainer,
            iconBgColor: AppColors.tertiaryContainer.withValues(alpha: 0.2),
            badgeText: profile.timeDelta,
            badgeColor: AppColors.tertiary,
            valueWidget: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${profile.totalTimeHours}',
                    style: AppTextStyles.headlineMd().copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: 'h',
                    style: AppTextStyles.titleMd(
                      color: AppColors.onSurfaceVariant,
                    ).copyWith(height: 1.0),
                  ),
                ],
              ),
            ),
            label: 'Total Time',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String badgeText;
  final Color badgeColor;
  final Widget valueWidget;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.badgeText,
    required this.badgeColor,
    required this.valueWidget,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.md,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 15, color: iconColor),
              ),
              Text(
                badgeText,
                style: AppTextStyles.labelSm(color: badgeColor).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          valueWidget,
          const SizedBox(height: 4),
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
