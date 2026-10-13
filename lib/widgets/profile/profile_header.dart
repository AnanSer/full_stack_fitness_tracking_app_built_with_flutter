import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../theme/app_theme.dart';

/// Profile Header: Avatar, Display Name, Verification Badge, Subtitle, and Quick Actions.
class ProfileHeader extends StatelessWidget {
  final UserProfile profile;
  final VoidCallback? onEditProfile;
  final VoidCallback? onShare;
  final VoidCallback? onChangePhoto;

  const ProfileHeader({
    super.key,
    required this.profile,
    this.onEditProfile,
    this.onShare,
    this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar with layered glow
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Glow backdrop
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryContainer.withValues(alpha: 0.22),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              // Main Avatar
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceContainerHigh,
                  border: Border.all(
                    color: AppColors.surfaceContainerHighest,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_rounded,
                    size: 52,
                    color: AppColors.primaryContainer,
                  ),
                ),
              ),
              // Camera floating badge
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onChangePhoto ?? () {},
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryContainer,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.photo_camera_rounded,
                      size: 16,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Display Name & Verified Badge
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              profile.name,
              style: AppTextStyles.headlineMd().copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (profile.isVerified) ...[
              const SizedBox(width: 6),
              const Icon(
                Icons.verified_rounded,
                size: 20,
                color: AppColors.primaryContainer,
              ),
            ],
          ],
        ),
        const SizedBox(height: 4),

        // Subtitle
        Text(
          profile.subtitle,
          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        // Quick Actions (Edit Profile + Share)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Edit Profile Button
            TextButton.icon(
              onPressed: onEditProfile ?? () {},
              icon: const Icon(
                Icons.edit_rounded,
                size: 16,
                color: AppColors.primary,
              ),
              label: Text(
                'Edit Profile',
                style: AppTextStyles.labelMd(
                  color: AppColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.surfaceContainerHigh,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 0,
              ),
            ),
            const SizedBox(width: 10),
            // Share Button
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.share_rounded,
                  size: 18,
                  color: AppColors.onSurfaceVariant,
                ),
                onPressed: onShare ?? () {},
                tooltip: 'Share Fitness Card',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
