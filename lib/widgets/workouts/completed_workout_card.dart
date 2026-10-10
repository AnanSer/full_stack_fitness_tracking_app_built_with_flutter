import 'package:flutter/material.dart';
import '../../models/workout_model.dart';
import '../../theme/app_theme.dart';

/// Completed workout card with header, badge, 4-metric strip, and footer notes.
class CompletedWorkoutCard extends StatelessWidget {
  final CompletedWorkoutSession session;
  final VoidCallback? onTap;

  const CompletedWorkoutCard({
    super.key,
    required this.session,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.xl,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ?? () {},
          borderRadius: AppRadius.xl,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top header row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon box
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: AppRadius.md,
                      ),
                      child: Icon(
                        session.icon,
                        size: 22,
                        color: session.category == 'hiit'
                            ? AppColors.secondary
                            : AppColors.primaryContainer,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Title and subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.title,
                            style: AppTextStyles.titleMd()
                                .copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            session.subtitle,
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
                    // Completed badge and timestamp
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer
                                .withValues(alpha: 0.15),
                            borderRadius: AppRadius.full,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check_rounded,
                                size: 13,
                                color: AppColors.primaryContainer,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'Completed',
                                style: AppTextStyles.labelSm(
                                  color: AppColors.primaryContainer,
                                ).copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          session.date,
                          style: AppTextStyles.labelSm(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // 4-metric strip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    borderRadius: AppRadius.md,
                  ),
                  child: Row(
                    children: session.metrics.map((metric) {
                      return Expanded(
                        child: Column(
                          children: [
                            Text(
                              metric.label,
                              style: AppTextStyles.labelSm(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              metric.value,
                              style: AppTextStyles.labelLg(
                                color: metric.valueColor ?? AppColors.onSurface,
                              ).copyWith(fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // Action footer
                if (session.footerNote != null) ...[
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            if (session.footerIcon != null) ...[
                              Icon(
                                session.footerIcon,
                                size: 15,
                                color: session.footerColor ??
                                    AppColors.primaryContainer,
                              ),
                              const SizedBox(width: 4),
                            ],
                            Expanded(
                              child: Text(
                                session.footerNote!,
                                style: AppTextStyles.labelSm(
                                  color: session.footerColor ??
                                      AppColors.onSurfaceVariant,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Details',
                            style: AppTextStyles.labelSm(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 16,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
