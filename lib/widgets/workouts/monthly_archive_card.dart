import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Archive awareness banner: "Viewing October 2024 Archive" + "Filter by Month"
class MonthlyArchiveCard extends StatelessWidget {
  final VoidCallback? onFilterByMonth;

  const MonthlyArchiveCard({super.key, this.onFilterByMonth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.md,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.folder_special_rounded,
              size: 20,
              color: AppColors.primaryContainer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Viewing October 2024 Archive',
                  style: AppTextStyles.labelMd()
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '18 total workout sessions logged this month',
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
          TextButton(
            onPressed: onFilterByMonth ?? () {},
            style: TextButton.styleFrom(
              backgroundColor: AppColors.surfaceContainerHigh,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: const StadiumBorder(),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Filter by Month',
                  style: AppTextStyles.labelSm(
                    color: AppColors.onSurface,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.expand_more_rounded,
                  size: 16,
                  color: AppColors.onSurface,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
