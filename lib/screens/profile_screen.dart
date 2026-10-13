import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../theme/app_theme.dart';
import '../widgets/profile/athletic_profile_list.dart';
import '../widgets/profile/profile_goal_card.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_settings_list.dart';
import '../widgets/profile/profile_stats_row.dart';

/// FitTrack Profile Screen matching the approved Google Stitch design.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showFeedback(BuildContext context, String message) {
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
    const profile = SampleProfile.user;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Sticky frosted app bar matching FitTrack design
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
                    Text('Fittrack Profile', style: AppTextStyles.titleMd()),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, size: 22),
                color: AppColors.onSurfaceVariant,
                onPressed: () => _showFeedback(context, 'Notifications opened'),
                tooltip: 'Notifications',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
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
            ],
          ),

          // Main Profile Content
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.xl,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // 1. Profile Header with Avatar & Actions
                ProfileHeader(
                  profile: profile,
                  onEditProfile: () =>
                      _showFeedback(context, 'Edit Profile opened'),
                  onShare: () => _showFeedback(context, 'Share Fitness Card'),
                  onChangePhoto: () =>
                      _showFeedback(context, 'Change photo tapped'),
                ),
                const SizedBox(height: AppSpacing.lg),

                // 2. Overview Stats (3 cards)
                const ProfileStatsRow(profile: profile),
                const SizedBox(height: AppSpacing.lg),

                // 3. Personal Fitness Goal Card
                const ProfileGoalCard(profile: profile),
                const SizedBox(height: AppSpacing.lg),

                // 4. Athletic Profile Details
                AthleticProfileList(
                  profile: profile,
                  onItemTap: (field) =>
                      _showFeedback(context, 'Editing $field'),
                ),
                const SizedBox(height: AppSpacing.lg),

                // 5. Preferences, Settings, Support, and Sign Out
                ProfileSettingsList(
                  profile: profile,
                  onSettingTap: (setting) =>
                      _showFeedback(context, 'Opened $setting'),
                  onSignOut: () =>
                      _showFeedback(context, 'Sign Out tapped (visual only)'),
                ),
                const SizedBox(height: AppSpacing.xl),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
