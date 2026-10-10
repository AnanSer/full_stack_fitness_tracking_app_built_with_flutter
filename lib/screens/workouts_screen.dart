import 'package:flutter/material.dart';
import '../models/workout_model.dart';
import '../theme/app_theme.dart';
import '../widgets/workouts/completed_workout_card.dart';
import '../widgets/workouts/monthly_archive_card.dart';
import '../widgets/workouts/ready_to_train_card.dart';
import '../widgets/workouts/workout_filter_chips.dart';
import '../widgets/workouts/workouts_summary_cards.dart';

/// Workouts Screen matching the approved Stitch design.
/// Allows browsing past workouts, filtering by category, and launching a session.
class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  String _selectedCategory = 'All';

  List<CompletedWorkoutSession> get _filteredSessions {
    if (_selectedCategory.toLowerCase() == 'all') {
      return SampleData.completedWorkoutSessions;
    }
    return SampleData.completedWorkoutSessions.where((s) {
      return s.category.toLowerCase() == _selectedCategory.toLowerCase();
    }).toList();
  }

  void _showWorkoutFeedbackToast(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.surfaceContainerHighest,
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.bolt_rounded,
              color: AppColors.primaryContainer,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              message,
              style: AppTextStyles.labelMd(color: AppColors.onSurface),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredSessions;

    return CustomScrollView(
      slivers: [
        // Sticky frosted app bar matching Stitch design
        SliverAppBar(
          pinned: true,
          floating: false,
          backgroundColor: AppColors.surface.withValues(alpha: 0.92),
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.4),
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: AppRadius.sm,
                ),
                child: Center(
                  child: Text(
                    'FT',
                    style: AppTextStyles.labelMd(
                      color: AppColors.onPrimary,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'FITTRACK',
                    style: AppTextStyles.labelSm(
                      color: AppColors.primaryContainer,
                    ).copyWith(letterSpacing: 2),
                  ),
                  Text('Workouts', style: AppTextStyles.titleMd()),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 22),
              color: AppColors.onSurfaceVariant,
              onPressed: () {},
              tooltip: 'Notifications',
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor:
                      AppColors.primaryContainer.withValues(alpha: 0.2),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 18,
                    color: AppColors.primaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Screen title & controls
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.md,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Workouts',
                        style: AppTextStyles.headlineLgMobile(),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Track, log, and review your training sessions.',
                        style: AppTextStyles.bodyMd(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Date range button
                    Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: AppRadius.full,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 16,
                            color: AppColors.tertiaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'This Week',
                            style: AppTextStyles.labelMd(),
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 18,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Tune / Filter button
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.tune_rounded,
                          size: 18,
                          color: AppColors.onSurfaceVariant,
                        ),
                        onPressed: () {},
                        tooltip: 'Filter and Sort',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // 3-Pillar summary cards
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverToBoxAdapter(
            child: WorkoutsSummaryCards(),
          ),
        ),

        // Ready to Train launch card
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
          ),
          sliver: SliverToBoxAdapter(
            child: ReadyToTrainCard(
              onStartWorkout: () => _showWorkoutFeedbackToast(
                'Launching training session tracker...',
              ),
              onResumeDraft: () => _showWorkoutFeedbackToast(
                'Resuming saved workout draft...',
              ),
              onCustomRoutine: () => _showWorkoutFeedbackToast(
                'Opening custom routines...',
              ),
            ),
          ),
        ),

        // Category filter chips
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverToBoxAdapter(
            child: WorkoutFilterChips(
              categories: SampleData.workoutFilterCategories,
              selectedCategory: _selectedCategory,
              onCategorySelected: (cat) {
                setState(() => _selectedCategory = cat);
              },
            ),
          ),
        ),

        // Completed sessions header
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.sm,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'COMPLETED SESSIONS',
                  style: AppTextStyles.labelSm(
                    color: AppColors.onSurfaceVariant,
                  ).copyWith(
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${filtered.length} logged this week',
                  style: AppTextStyles.labelSm(
                    color: AppColors.primaryContainer,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),

        // Completed workout list
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final session = filtered[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CompletedWorkoutCard(session: session),
                );
              },
              childCount: filtered.length,
            ),
          ),
        ),

        // Monthly Archive card
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.xs,
            AppSpacing.md,
            AppSpacing.xl,
          ),
          sliver: SliverToBoxAdapter(
            child: MonthlyArchiveCard(),
          ),
        ),
      ],
    );
  }
}
