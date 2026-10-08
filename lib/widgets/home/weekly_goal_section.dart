import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/workout_model.dart';

/// Weekly goal progress — circular gauge, 7-day dot row, milestone badge.
class WeeklyGoalSection extends StatelessWidget {
  const WeeklyGoalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppRadius.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with radial gauge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weekly Goal Progress',
                      style: AppTextStyles.titleMd()),
                  const SizedBox(height: 2),
                  Text(
                    '${SampleData.weeklyCompletedSessions} of '
                    '${SampleData.weeklyGoalSessions} sessions completed',
                    style: AppTextStyles.bodyMd(
                        color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
              // Simple circular progress widget
              _CircularGauge(
                  percent: SampleData.weeklyProgressPercent / 100),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // 7-day dot tracker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: SampleData.weekDays
                .map((d) => _DayDot(label: d.label, state: d.state))
                .toList(),
          ),
          const SizedBox(height: AppSpacing.md),
          // Milestone badge row
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: AppRadius.lg,
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        AppColors.tertiaryContainer.withValues(alpha: 0.13),
                    borderRadius: AppRadius.md,
                  ),
                  child: const Icon(Icons.military_tech_rounded,
                      size: 22, color: AppColors.tertiaryContainer),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(SampleData.milestoneName,
                          style: AppTextStyles.labelLg(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(SampleData.milestoneSubtitle,
                          style: AppTextStyles.labelSm(
                              color: AppColors.onSurfaceVariant),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right_rounded,
                    size: 20, color: AppColors.primaryContainer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Simple circular progress gauge using CustomPainter
// (no complex animation — just a static arc, as instructed)
// ---------------------------------------------------------------------------
class _CircularGauge extends StatelessWidget {
  final double percent; // 0.0 to 1.0

  const _CircularGauge({required this.percent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: CustomPaint(
        painter: _GaugePainter(percent: percent),
        child: Center(
          child: Text(
            '${(percent * 100).round()}%',
            style: AppTextStyles.labelMd()
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double percent;

  _GaugePainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final radius = (size.width - 6) / 2;
    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: radius);

    // Track
    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi,
      false,
      Paint()
        ..color = AppColors.outlineVariant
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Progress arc
    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * percent,
      false,
      Paint()
        ..color = AppColors.primaryContainer
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_GaugePainter oldDelegate) =>
      oldDelegate.percent != percent;
}

// ---------------------------------------------------------------------------
// Day dot — shows workout state as a colored circle
// state: 0=rest, 1=done, 2=today-done, 3=target, 4=scheduled-rest
// ---------------------------------------------------------------------------
class _DayDot extends StatelessWidget {
  final String label;
  final int state;

  const _DayDot({required this.label, required this.state});

  @override
  Widget build(BuildContext context) {
    Widget dotChild;
    Color dotBg;
    Color dotFg;

    switch (state) {
      case 1: // completed
        dotBg = AppColors.primaryContainer;
        dotFg = AppColors.onPrimary;
        dotChild = const Icon(Icons.check_rounded, size: 17);
        break;
      case 2: // today & done — slightly lighter primary
        dotBg = AppColors.primary;
        dotFg = AppColors.onPrimary;
        dotChild = const Icon(Icons.check_rounded, size: 17);
        break;
      case 3: // today — scheduled / not yet done
        dotBg = AppColors.primaryContainer.withValues(alpha: 0.18);
        dotFg = AppColors.primaryContainer;
        dotChild =
            const Icon(Icons.priority_high_rounded, size: 17);
        break;
      case 4: // rest day scheduled
        dotBg = AppColors.surfaceContainer;
        dotFg = AppColors.onSurfaceVariant.withValues(alpha: 0.5);
        dotChild = const Icon(Icons.hotel_rounded, size: 15);
        break;
      default: // generic rest
        dotBg = AppColors.surfaceContainer;
        dotFg = AppColors.onSurfaceVariant.withValues(alpha: 0.5);
        dotChild =
            const Icon(Icons.self_improvement_rounded, size: 15);
    }

    return Column(
      children: [
        Text(
          label,
          style: AppTextStyles.labelSm(
            color: state == 2
                ? AppColors.primaryContainer
                : AppColors.onSurfaceVariant,
          ).copyWith(
            fontWeight:
                state == 2 ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: dotBg,
            shape: BoxShape.circle,
          ),
          child: IconTheme(
            data: IconThemeData(color: dotFg),
            child: Center(child: dotChild),
          ),
        ),
      ],
    );
  }
}
