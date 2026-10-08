import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/workout_model.dart';

/// Recent workouts log + trainer tip footer.
class RecentWorkoutsSection extends StatelessWidget {
  const RecentWorkoutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Workouts', style: AppTextStyles.titleLg()),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'View All',
                style: AppTextStyles.labelMd(
                    color: AppColors.primaryContainer),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Workout entry list
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: SampleData.recentWorkouts.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: 10),
          itemBuilder: (context, i) =>
              _WorkoutEntry(workout: SampleData.recentWorkouts[i]),
        ),
        const SizedBox(height: AppSpacing.md),
        // Trainer tip footer card
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh.withValues(alpha: 0.65),
            borderRadius: AppRadius.lg,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.lightbulb_outline_rounded,
                  size: 20, color: AppColors.primaryContainer),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trainer Tip of the Day',
                        style: AppTextStyles.labelLg()),
                    const SizedBox(height: 4),
                    Text(
                      SampleData.trainerTip,
                      style: AppTextStyles.bodyMd(
                          color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WorkoutEntry extends StatelessWidget {
  final WorkoutSummary workout;

  const _WorkoutEntry({required this.workout});

  IconData get _icon {
    switch (workout.type) {
      case WorkoutType.strength:
        return Icons.fitness_center_rounded;
      case WorkoutType.cardio:
        return Icons.monitor_heart_rounded;
      case WorkoutType.flexibility:
        return Icons.sports_gymnastics_rounded;
    }
  }

  Color get _iconBg {
    switch (workout.type) {
      case WorkoutType.strength:
        return AppColors.primaryContainer.withValues(alpha: 0.13);
      case WorkoutType.cardio:
        return AppColors.secondaryContainer.withValues(alpha: 0.18);
      case WorkoutType.flexibility:
        return AppColors.tertiaryContainer.withValues(alpha: 0.13);
    }
  }

  Color get _iconFg {
    switch (workout.type) {
      case WorkoutType.strength:
        return AppColors.primaryContainer;
      case WorkoutType.cardio:
        return AppColors.secondary;
      case WorkoutType.flexibility:
        return AppColors.tertiaryContainer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.lg,
      ),
      child: Row(
        children: [
          // Type icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _iconBg,
              borderRadius: AppRadius.lg,
            ),
            child: Icon(_icon, size: 24, color: _iconFg),
          ),
          const SizedBox(width: 14),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        workout.title,
                        style: AppTextStyles.titleMd(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (workout.isCompleted)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle_outline_rounded,
                              size: 14,
                              color: AppColors.primaryContainer),
                          const SizedBox(width: 3),
                          Text(
                            'Complete',
                            style: AppTextStyles.labelSm(
                                color: AppColors.primaryContainer)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  workout.timestamp,
                  style: AppTextStyles.labelSm(
                      color: AppColors.onSurfaceVariant),
                ),
                const SizedBox(height: 7),
                // Meta strip
                Wrap(
                  spacing: 12,
                  children: [
                    _MetaBit(
                        icon: Icons.fitness_center_rounded,
                        text: '${workout.exerciseCount} exercises'),
                    _MetaBit(
                        icon: Icons.timer_outlined,
                        text: '${workout.durationMinutes} min'),
                    _MetaBit(
                        icon: Icons.local_fire_department_rounded,
                        text: '${workout.kcal} kcal',
                        color: AppColors.secondary),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaBit extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _MetaBit({required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: c),
        const SizedBox(width: 3),
        Text(text, style: AppTextStyles.labelSm(color: c)),
      ],
    );
  }
}
