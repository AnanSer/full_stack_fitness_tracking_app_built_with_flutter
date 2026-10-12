import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Exercise item representation for the Exercise Library.
class Exercise {
  final String name;
  final String muscleGroup;
  final String equipment;
  final String difficulty;
  final String targetDetails;
  final IconData icon;
  final Color iconColor;

  const Exercise({
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.difficulty,
    required this.targetDetails,
    required this.icon,
    this.iconColor = AppColors.primaryContainer,
  });
}

/// Static sample data for the Exercise Library.
class SampleExercises {
  SampleExercises._();

  static const List<String> muscleFilterCategories = [
    'All',
    'Chest',
    'Back',
    'Shoulders',
    'Arms',
    'Legs',
    'Core',
  ];

  static const List<Exercise> exercises = [
    Exercise(
      name: 'Barbell Bench Press',
      muscleGroup: 'Chest',
      equipment: 'Barbell',
      difficulty: 'Intermediate',
      targetDetails: 'Primary: Pectoralis Major • Compound',
      icon: Icons.fitness_center_rounded,
      iconColor: AppColors.primaryContainer,
    ),
    Exercise(
      name: 'Push-ups',
      muscleGroup: 'Chest',
      equipment: 'Bodyweight',
      difficulty: 'Beginner',
      targetDetails: 'Primary: Pectorals & Triceps • Baseline',
      icon: Icons.accessibility_new_rounded,
      iconColor: AppColors.primaryContainer,
    ),
    Exercise(
      name: 'Lat Pulldown',
      muscleGroup: 'Back',
      equipment: 'Cable Machine',
      difficulty: 'Beginner',
      targetDetails: 'Primary: Latissimus Dorsi • Hypertrophy',
      icon: Icons.vertical_align_bottom_rounded,
      iconColor: AppColors.tertiaryContainer,
    ),
    Exercise(
      name: 'Dumbbell Shoulder Press',
      muscleGroup: 'Shoulders',
      equipment: 'Dumbbells',
      difficulty: 'Intermediate',
      targetDetails: 'Primary: Anterior Deltoids • Overhead',
      icon: Icons.fitness_center_rounded,
      iconColor: AppColors.secondary,
    ),
    Exercise(
      name: 'Barbell Back Squats',
      muscleGroup: 'Legs',
      equipment: 'Barbell',
      difficulty: 'Intermediate',
      targetDetails: 'Primary: Quadriceps & Glutes • Heavy Pillar',
      icon: Icons.directions_run_rounded,
      iconColor: AppColors.primaryContainer,
    ),
    Exercise(
      name: 'Forearm Plank',
      muscleGroup: 'Core',
      equipment: 'Bodyweight',
      difficulty: 'Beginner',
      targetDetails: 'Primary: Transverse Abdominis • Isometric',
      icon: Icons.timer_outlined,
      iconColor: AppColors.secondary,
    ),
    Exercise(
      name: 'Bicep Dumbbell Curls',
      muscleGroup: 'Arms',
      equipment: 'Dumbbells',
      difficulty: 'Beginner',
      targetDetails: 'Primary: Biceps Brachii • Isolation',
      icon: Icons.fitness_center_rounded,
      iconColor: AppColors.primaryContainer,
    ),
    Exercise(
      name: 'Tricep Bench Dips',
      muscleGroup: 'Arms',
      equipment: 'Bodyweight',
      difficulty: 'Intermediate',
      targetDetails: 'Primary: Triceps Brachii • Baseline',
      icon: Icons.accessibility_new_rounded,
      iconColor: AppColors.tertiaryContainer,
    ),
  ];
}
