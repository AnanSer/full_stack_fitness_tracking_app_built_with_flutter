import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../theme/app_theme.dart';
import '../widgets/exercises/daily_suggestion_banner.dart';
import '../widgets/exercises/exercise_card.dart';
import '../widgets/exercises/exercise_search_bar.dart';
import '../widgets/exercises/muscle_filter_chips.dart';

/// Exercise Library Screen matching the approved Stitch design.
/// Supports search filtering, muscle group categories, and custom movement action.
class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Exercise> get _filteredExercises {
    return SampleExercises.exercises.where((exercise) {
      // Category filter (All shows every exercise)
      final matchesCategory = _selectedCategory.toLowerCase() == 'all' ||
          exercise.muscleGroup.toLowerCase() ==
              _selectedCategory.toLowerCase();

      // Search query filter (matches name, muscleGroup, equipment, or details)
      final q = _searchQuery.toLowerCase().trim();
      final matchesQuery = q.isEmpty ||
          exercise.name.toLowerCase().contains(q) ||
          exercise.muscleGroup.toLowerCase().contains(q) ||
          exercise.equipment.toLowerCase().contains(q) ||
          exercise.targetDetails.toLowerCase().contains(q);

      return matchesCategory && matchesQuery;
    }).toList();
  }

  void _showFeedbackToast(String message) {
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
    final filtered = _filteredExercises;

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: ElevatedButton.icon(
          onPressed: () => _showFeedbackToast('Opening Custom Movement creator...'),
          icon: const Icon(Icons.add_rounded, size: 20),
          label: Text(
            'Custom Movement',
            style: AppTextStyles.labelLg(
              color: AppColors.onPrimary,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryContainer,
            foregroundColor: AppColors.onPrimary,
            elevation: 8,
            shadowColor: AppColors.primaryContainer.withValues(alpha: 0.35),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
      ),
      body: CustomScrollView(
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
                    Text('Fittrack Exercises', style: AppTextStyles.titleMd()),
                  ],
                ),
              ],
            ),
            actions: [
              // Notification bell with badge
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined, size: 22),
                    color: AppColors.onSurfaceVariant,
                    onPressed: () {},
                    tooltip: 'Notifications',
                  ),
                  Positioned(
                    top: 10,
                    right: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryContainer,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
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

          // Screen header & action icons
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              AppSpacing.md,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exercise Library',
                          style: AppTextStyles.headlineLgMobile(),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Find your next move • 428 curated moves',
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
                      // Bookmark button with notification dot
                      Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerLow,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.bookmark_rounded,
                                size: 18,
                                color: AppColors.onSurfaceVariant,
                              ),
                              onPressed: () =>
                                  _showFeedbackToast('Viewing saved exercises'),
                              tooltip: 'Saved Exercises',
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryContainer,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      // Filter button
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLow,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.tune_rounded,
                            size: 18,
                            color: AppColors.onSurfaceVariant,
                          ),
                          onPressed: () =>
                              _showFeedbackToast('Filter options opened'),
                          tooltip: 'Open Filter Drawer',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Search input
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: ExerciseSearchBar(
                controller: _searchController,
                onChanged: (val) {
                  setState(() => _searchQuery = val);
                },
                onClear: () {
                  setState(() => _searchQuery = '');
                },
                onVoiceSearch: () {
                  _showFeedbackToast('Voice search listening...');
                },
              ),
            ),
          ),

          // Muscle group filter chips
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            sliver: SliverToBoxAdapter(
              child: MuscleFilterChips(
                categories: SampleExercises.muscleFilterCategories,
                selectedCategory: _selectedCategory,
                onCategorySelected: (cat) {
                  setState(() => _selectedCategory = cat);
                },
              ),
            ),
          ),

          // Daily suggestion banner
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              AppSpacing.md,
            ),
            sliver: SliverToBoxAdapter(
              child: DailySuggestionBanner(
                onTap: () => _showFeedbackToast(
                  'Starting Full-Body Dynamic Primer...',
                ),
              ),
            ),
          ),

          // Popular Exercises section header
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Popular Exercises',
                        style: AppTextStyles.titleLg(),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '(${filtered.length} Showing)',
                        style: AppTextStyles.labelSm(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Text(
                      'Alphabetical',
                      style: AppTextStyles.labelSm(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    label: const Icon(
                      Icons.expand_more_rounded,
                      size: 16,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Exercise items list or empty state
          if (filtered.isEmpty)
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.fitness_center_rounded,
                        size: 48,
                        color: AppColors.outline,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'No exercises found',
                        style: AppTextStyles.titleMd(),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Try adjusting your search or muscle group filter.',
                        style: AppTextStyles.bodyMd(
                          color: AppColors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategory = 'All';
                            _searchQuery = '';
                            _searchController.clear();
                          });
                        },
                        child: Text(
                          'Reset Filters',
                          style: AppTextStyles.labelMd(
                            color: AppColors.primaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final exercise = filtered[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ExerciseCard(
                        exercise: exercise,
                        onTap: () => _showFeedbackToast(
                          'Viewing details for ${exercise.name}',
                        ),
                      ),
                    );
                  },
                  childCount: filtered.length,
                ),
              ),
            ),

          // Bottom padding to ensure content is clear of Floating Action Button and navigation
          const SliverPadding(
            padding: EdgeInsets.only(bottom: 80),
          ),
        ],
      ),
    );
  }
}
