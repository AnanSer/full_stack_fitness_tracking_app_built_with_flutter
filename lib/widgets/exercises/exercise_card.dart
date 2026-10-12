import 'package:flutter/material.dart';
import '../../models/exercise_model.dart';
import '../../theme/app_theme.dart';

/// Tactile M3 container for an exercise item in the Exercise Library.
class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback? onTap;

  const ExerciseCard({
    super.key,
    required this.exercise,
    this.onTap,
  });

  Color _getDifficultyBg(String diff) {
    switch (diff.toLowerCase()) {
      case 'beginner':
        return AppColors.primaryContainer.withValues(alpha: 0.18);
      case 'intermediate':
        return AppColors.tertiaryContainer.withValues(alpha: 0.15);
      case 'advanced':
        return AppColors.secondaryContainer.withValues(alpha: 0.25);
      default:
        return AppColors.surfaceContainer;
    }
  }

  Color _getDifficultyFg(String diff) {
    switch (diff.toLowerCase()) {
      case 'beginner':
        return AppColors.primaryContainer;
      case 'intermediate':
        return AppColors.tertiaryContainer;
      case 'advanced':
        return AppColors.secondary;
      default:
        return AppColors.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.xl,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ?? () {},
          borderRadius: AppRadius.xl,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon Box (56x56)
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    borderRadius: AppRadius.md,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: exercise.iconColor.withValues(alpha: 0.08),
                          borderRadius: AppRadius.md,
                        ),
                      ),
                      Icon(
                        exercise.icon,
                        size: 26,
                        color: exercise.iconColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                // Exercise info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tag row
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          _buildTag(exercise.muscleGroup),
                          _buildTag(exercise.equipment),
                          _buildDifficultyTag(exercise.difficulty),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Title
                      Text(
                        exercise.name,
                        style: AppTextStyles.titleMd().copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      // Subtitle / target details
                      Text(
                        exercise.targetDetails,
                        style: AppTextStyles.bodyMd(
                          color: AppColors.onSurfaceVariant,
                        ).copyWith(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Chevron right
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppColors.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: AppRadius.full,
      ),
      child: Text(
        text,
        style: AppTextStyles.labelSm(
          color: AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildDifficultyTag(String diff) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getDifficultyBg(diff),
        borderRadius: AppRadius.full,
      ),
      child: Text(
        diff,
        style: AppTextStyles.labelSm(
          color: _getDifficultyFg(diff),
        ).copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
