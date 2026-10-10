import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Quick Start & Launch Panel: "Ready to train?", Start Empty Workout CTA,
/// Resume Draft, and Custom Routine buttons.
class ReadyToTrainCard extends StatelessWidget {
  final VoidCallback? onStartWorkout;
  final VoidCallback? onResumeDraft;
  final VoidCallback? onCustomRoutine;

  const ReadyToTrainCard({
    super.key,
    this.onStartWorkout,
    this.onResumeDraft,
    this.onCustomRoutine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.xl,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.xl,
        child: Stack(
          children: [
            // Ambient corner glow
            Positioned(
              right: -32,
              top: -32,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryContainer.withValues(alpha: 0.08),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Live session badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryContainer
                                    .withValues(alpha: 0.15),
                                borderRadius: AppRadius.full,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryContainer,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'LIVE SESSION',
                                    style: AppTextStyles.labelSm(
                                      color: AppColors.primaryContainer,
                                    ).copyWith(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Ready to train?',
                              style: AppTextStyles.titleLg()
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Pick up where you left off or log an empty freestyle set.',
                              style: AppTextStyles.bodyMd(
                                color: AppColors.onSurfaceVariant,
                              ).copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainer,
                          borderRadius: AppRadius.md,
                        ),
                        child: const Icon(
                          Icons.fitness_center_rounded,
                          size: 24,
                          color: AppColors.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Primary CTA button: Start Empty Workout
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: onStartWorkout ?? () {},
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        size: 24,
                      ),
                      label: Text(
                        'Start Empty Workout',
                        style: AppTextStyles.labelLg(
                          color: AppColors.onPrimary,
                        ).copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryContainer,
                        foregroundColor: AppColors.onPrimary,
                        elevation: 0,
                        shape: const StadiumBorder(),
                        shadowColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Secondary action buttons: Resume Draft & Custom Routine
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: TextButton.icon(
                            onPressed: onResumeDraft ?? () {},
                            icon: const Icon(
                              Icons.history_rounded,
                              size: 17,
                              color: AppColors.tertiaryContainer,
                            ),
                            label: Text(
                              'Resume Draft',
                              style: AppTextStyles.labelMd(
                                color: AppColors.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.surfaceContainer,
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: TextButton.icon(
                            onPressed: onCustomRoutine ?? () {},
                            icon: const Icon(
                              Icons.bookmark_add_rounded,
                              size: 17,
                              color: AppColors.primaryContainer,
                            ),
                            label: Text(
                              'Custom Routine',
                              style: AppTextStyles.labelMd(
                                color: AppColors.onSurface,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.surfaceContainer,
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
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
