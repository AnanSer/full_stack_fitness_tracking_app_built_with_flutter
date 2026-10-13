import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../theme/app_theme.dart';

/// Athletic Profile Section: Fitness Level, Preferred Style, Weekly Target, Body Weight.
class AthleticProfileList extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<String>? onItemTap;

  const AthleticProfileList({
    super.key,
    required this.profile,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ATHLETIC PROFILE',
                style: AppTextStyles.labelLg().copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                'Tap row to edit',
                style: AppTextStyles.labelSm(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Items Container
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
              _buildRow(
                icon: Icons.signal_cellular_alt_rounded,
                iconColor: AppColors.primary,
                title: 'Fitness Level',
                trailing: Text(
                  profile.fitnessLevel,
                  style: AppTextStyles.labelMd(
                    color: AppColors.onSurfaceVariant,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
                onTap: () => onItemTap?.call('Fitness Level'),
              ),
              _buildRow(
                icon: Icons.sports_gymnastics_rounded,
                iconColor: AppColors.secondary,
                title: 'Preferred Style',
                trailing: Text(
                  profile.preferredStyle,
                  style: AppTextStyles.labelMd(
                    color: AppColors.onSurfaceVariant,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
                onTap: () => onItemTap?.call('Preferred Style'),
              ),
              _buildRow(
                icon: Icons.calendar_month_rounded,
                iconColor: AppColors.tertiaryContainer,
                title: 'Weekly Target',
                trailing: Text(
                  profile.weeklyTarget,
                  style: AppTextStyles.labelMd(
                    color: AppColors.onSurfaceVariant,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
                onTap: () => onItemTap?.call('Weekly Target'),
              ),
              _buildRow(
                icon: Icons.scale_rounded,
                iconColor: AppColors.primaryContainer,
                title: 'Body Weight',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      profile.bodyWeight,
                      style: AppTextStyles.labelMd(
                        color: AppColors.primaryContainer,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.trending_down_rounded,
                      size: 16,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ],
                ),
                onTap: () => onItemTap?.call('Body Weight'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.sm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 17, color: iconColor),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: AppTextStyles.bodyMd(color: AppColors.onSurface)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
