import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Search input bar for searching exercises by name, muscle, equipment.
class ExerciseSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onVoiceSearch;

  const ExerciseSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onClear,
    this.onVoiceSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            color: AppColors.outline,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: AppTextStyles.bodyMd(color: AppColors.onSurface),
              decoration: InputDecoration(
                hintText: 'Search exercises, muscles, equipment...',
                hintStyle: AppTextStyles.bodyMd(color: AppColors.outline),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (controller.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 18),
              color: AppColors.onSurfaceVariant,
              onPressed: () {
                controller.clear();
                onChanged('');
                if (onClear != null) onClear!();
              },
              tooltip: 'Clear search',
            )
          else
            IconButton(
              icon: const Icon(Icons.mic_rounded, size: 20),
              color: AppColors.onSurfaceVariant,
              onPressed: onVoiceSearch,
              tooltip: 'Voice Search',
            ),
        ],
      ),
    );
  }
}
