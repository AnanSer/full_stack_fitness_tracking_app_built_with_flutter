import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Discovery & Target Muscle Micro-Banner: Daily Suggestion
class DailySuggestionBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const DailySuggestionBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.md,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ?? () {},
          borderRadius: AppRadius.md,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Bolt icon box
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: AppRadius.sm,
                  ),
                  child: const Icon(
                    Icons.bolt_rounded,
                    size: 22,
                    color: AppColors.primaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                // Title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DAILY SUGGESTION',
                        style: AppTextStyles.labelSm(
                          color: AppColors.primaryContainer,
                        ).copyWith(
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Full-Body Dynamic Primer',
                        style: AppTextStyles.titleMd(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Active count pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
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
                        '42 Active',
                        style: AppTextStyles.labelSm(
                          color: AppColors.onSurfaceVariant,
                        ).copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
