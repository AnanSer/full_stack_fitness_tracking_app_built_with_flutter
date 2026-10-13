import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../theme/app_theme.dart';

/// Personal Fitness Goal Card with weekly progress bar and description.
class ProfileGoalCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileGoalCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.md,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.track_changes_rounded,
                        size: 18,
                        color: AppColors.primaryContainer,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRIMARY FOCUS',
                            style: AppTextStyles.labelSm(
                              color: AppColors.onSurfaceVariant,
                            ).copyWith(letterSpacing: 0.8),
                          ),
                          Text(
                            profile.primaryFocus,
                            style: AppTextStyles.titleMd().copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: AppRadius.full,
                ),
                child: Text(
                  'Active Goal',
                  style: AppTextStyles.labelSm(
                    color: AppColors.primaryContainer,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Progress Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer.withValues(alpha: 0.7),
              borderRadius: AppRadius.sm,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weekly Commitment',
                      style: AppTextStyles.bodyMd(color: AppColors.onSurface)
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${profile.completedSessions} of ${profile.totalSessions} sessions',
                      style: AppTextStyles.labelMd(
                        color: AppColors.primaryContainer,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Custom Progress Bar Track
                ClipRRect(
                  borderRadius: AppRadius.full,
                  child: Container(
                    height: 8,
                    width: double.infinity,
                    color: AppColors.surfaceContainerHighest,
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: profile.goalProgress.clamp(0.0, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: AppRadius.full,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryContainer
                                  .withValues(alpha: 0.5),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(profile.goalProgress * 100).round()}% completed',
                      style: AppTextStyles.labelSm(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      '${profile.totalSessions - profile.completedSessions} session to goal',
                      style: AppTextStyles.labelSm(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Description Note
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 18,
                color: AppColors.primaryContainer,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  profile.goalDescription,
                  style: AppTextStyles.bodyMd(
                    color: AppColors.onSurfaceVariant,
                  ).copyWith(fontSize: 13, height: 1.4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
