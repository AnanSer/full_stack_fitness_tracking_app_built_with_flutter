import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../theme/app_theme.dart';

/// Preferences, Support, and Sign Out sections for Profile screen.
class ProfileSettingsList extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<String>? onSettingTap;
  final VoidCallback? onSignOut;

  const ProfileSettingsList({
    super.key,
    required this.profile,
    this.onSettingTap,
    this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Preferences & Settings Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'PREFERENCES & SETTINGS',
            style: AppTextStyles.labelLg().copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Settings Container
        Container(
          padding: const EdgeInsets.all(8),
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
            children: [
              _buildSettingRow(
                icon: Icons.notifications_active_rounded,
                iconColor: AppColors.primary,
                title: 'Notifications',
                subtitle: 'Reminders, Streaks & Tips',
                trailingText: 'Enabled',
                trailingTextColor: AppColors.primaryContainer,
                onTap: () => onSettingTap?.call('Notifications'),
              ),
              _buildSettingRow(
                icon: Icons.dark_mode_rounded,
                iconColor: AppColors.tertiaryContainer,
                title: 'Appearance',
                subtitle: 'Theme Display Mode',
                trailingText: 'Dark OLED',
                onTap: () => onSettingTap?.call('Appearance'),
              ),
              _buildSettingRow(
                icon: Icons.straighten_rounded,
                iconColor: AppColors.secondary,
                title: 'Units of Measure',
                subtitle: 'Weight, Volume & Distance',
                trailingText: 'Metric (kg, km)',
                onTap: () => onSettingTap?.call('Units of Measure'),
              ),
              _buildSettingRow(
                icon: Icons.shield_rounded,
                iconColor: AppColors.primaryContainer,
                title: 'Privacy & Sharing',
                subtitle: 'Data sharing & community visibility',
                onTap: () => onSettingTap?.call('Privacy & Sharing'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // 2. Support & Community Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'SUPPORT & COMMUNITY',
            style: AppTextStyles.labelLg().copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Support Container
        Container(
          padding: const EdgeInsets.all(8),
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
            children: [
              _buildSimpleRow(
                icon: Icons.help_center_rounded,
                title: 'Help & Feedback',
                onTap: () => onSettingTap?.call('Help & Feedback'),
              ),
              _buildSimpleRow(
                icon: Icons.info_rounded,
                title: 'About FitTrack',
                trailingText: profile.appVersion,
                onTap: () => onSettingTap?.call('About FitTrack'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // 3. Sign Out Action
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: onSignOut ?? () {},
                icon: const Icon(
                  Icons.logout_rounded,
                  size: 20,
                  color: AppColors.error,
                ),
                label: Text(
                  'Sign Out',
                  style: AppTextStyles.labelLg(color: AppColors.error).copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerLow,
                  side: BorderSide(
                    color: AppColors.error.withValues(alpha: 0.25),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Logged in as ${profile.email}',
                style: AppTextStyles.labelSm(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    String? trailingText,
    Color? trailingTextColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.sm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: AppRadius.sm,
                ),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleMd().copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTextStyles.labelSm(
                        color: AppColors.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (trailingText != null) ...[
                const SizedBox(width: 8),
                Text(
                  trailingText,
                  style: AppTextStyles.labelSm(
                    color: trailingTextColor ?? AppColors.onSurfaceVariant,
                  ).copyWith(
                    fontWeight:
                        trailingTextColor != null ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ],
              const SizedBox(width: 4),
              const Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleRow({
    required IconData icon,
    required String title,
    String? trailingText,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.sm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: AppRadius.sm,
                ),
                child: Icon(icon, size: 20, color: AppColors.onSurface),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.titleMd().copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                Text(
                  trailingText,
                  style: AppTextStyles.labelSm(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              const Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
