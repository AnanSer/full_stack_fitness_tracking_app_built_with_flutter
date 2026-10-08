import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/home/greeting_section.dart';
import '../widgets/home/today_workout_card.dart';
import '../widgets/home/monthly_snapshot_section.dart';
import '../widgets/home/weekly_goal_section.dart';
import '../widgets/home/recent_workouts_section.dart';
import 'placeholder_screen.dart';

/// Root scaffold — hosts bottom navigation + page content.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Top-level navigation destinations
  static const _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.fitness_center_outlined),
      selectedIcon: Icon(Icons.fitness_center_rounded),
      label: 'Workouts',
    ),
    NavigationDestination(
      icon: Icon(Icons.sports_gymnastics_outlined),
      selectedIcon: Icon(Icons.sports_gymnastics_rounded),
      label: 'Exercises',
    ),
    NavigationDestination(
      icon: Icon(Icons.account_circle_outlined),
      selectedIcon: Icon(Icons.account_circle_rounded),
      label: 'Profile',
    ),
  ];

  static const _pages = [
    _DashboardPage(),
    PlaceholderScreen(
        title: 'Workouts', icon: Icons.fitness_center_rounded),
    PlaceholderScreen(
        title: 'Exercises', icon: Icons.sports_gymnastics_rounded),
    PlaceholderScreen(
        title: 'Profile', icon: Icons.account_circle_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // Frosted glass bottom nav bar matching Stitch design
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) =>
            setState(() => _selectedIndex = i),
        destinations: _destinations,
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Home / Dashboard page — scrollable content with sticky app bar
// ---------------------------------------------------------------------------
class _DashboardPage extends StatelessWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Sticky frosted app bar
        SliverAppBar(
          pinned: true,
          floating: false,
          backgroundColor:
              AppColors.surface.withValues(alpha: 0.92),
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.4),
          title: Row(
            children: [
              // Logo placeholder — small emerald circle with "FT"
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
                            color: AppColors.onPrimary)
                        .copyWith(fontWeight: FontWeight.w700),
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
                            color: AppColors.primaryContainer)
                        .copyWith(letterSpacing: 2),
                  ),
                  Text('Home',
                      style: AppTextStyles.titleMd()),
                ],
              ),
            ],
          ),
          actions: [
            // Notification bell
            IconButton(
              icon: const Icon(Icons.notifications_outlined,
                  size: 22),
              color: AppColors.onSurfaceVariant,
              onPressed: () {},
              tooltip: 'Notifications',
            ),
            // Avatar
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primaryContainer
                      .withValues(alpha: 0.2),
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

        // Scrollable body sections
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md, vertical: AppSpacing.md),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // 1. Greeting
              const GreetingSection(),
              const SizedBox(height: AppSpacing.lg),
              // 2. Today's Workout Hero
              const TodayWorkoutCard(),
              const SizedBox(height: AppSpacing.lg),
              // 3. Monthly Snapshot
              const MonthlySnapshotSection(),
              const SizedBox(height: AppSpacing.lg),
              // 4. Weekly Goal Progress
              const WeeklyGoalSection(),
              const SizedBox(height: AppSpacing.lg),
              // 5. Recent Workouts + Trainer Tip
              const RecentWorkoutsSection(),
              // Bottom breathing room above nav bar
              const SizedBox(height: AppSpacing.xl),
            ]),
          ),
        ),
      ],
    );
  }
}
