import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// Static sample data used across the Home dashboard & Workouts screen.
// No backend, database, or API is involved.

class WorkoutSummary {
  final String title;
  final String timestamp;
  final int exerciseCount;
  final int durationMinutes;
  final int kcal;
  final WorkoutType type;
  final bool isCompleted;

  const WorkoutSummary({
    required this.title,
    required this.timestamp,
    required this.exerciseCount,
    required this.durationMinutes,
    required this.kcal,
    required this.type,
    this.isCompleted = true,
  });
}

enum WorkoutType { strength, cardio, flexibility }

class TodayWorkout {
  final String focusTag;
  final String title;
  final String description;
  final int exerciseCount;
  final int durationMinutes;
  final String intensity;
  final int kcalEstimate;
  final String optimalWindow;

  const TodayWorkout({
    required this.focusTag,
    required this.title,
    required this.description,
    required this.exerciseCount,
    required this.durationMinutes,
    required this.intensity,
    required this.kcalEstimate,
    required this.optimalWindow,
  });
}

class MonthlyStats {
  final int workoutsDone;
  final int workoutsDelta;
  final int activeStreakDays;
  final int bestStreakDays;
  final double timeActiveHours;
  final int timeActivePercent;

  const MonthlyStats({
    required this.workoutsDone,
    required this.workoutsDelta,
    required this.activeStreakDays,
    required this.bestStreakDays,
    required this.timeActiveHours,
    required this.timeActivePercent,
  });
}

// ---------------------------------------------------------------------------
// Static sample data
// ---------------------------------------------------------------------------
class SampleData {
  SampleData._();

  static const String userName = 'Alex';
  static const String greeting = 'Good morning';
  static const String subtitle = 'Ready to crush your workout today?';
  static const String dateLabel = 'Wednesday, Oct 24';
  static const int streakDays = 5;

  static const todayWorkout = TodayWorkout(
    focusTag: "TODAY'S FOCUS · UPPER BODY",
    title: 'Upper Body Hypertrophy',
    description:
        'Focus on chest density, lateral delts, and arms hypertrophy.',
    exerciseCount: 6,
    durationMinutes: 45,
    intensity: 'Med',
    kcalEstimate: 340,
    optimalWindow: 'Optimal window: 9:00 AM – 11:30 AM',
  );

  static const monthlyStats = MonthlyStats(
    workoutsDone: 18,
    workoutsDelta: 3,
    activeStreakDays: 5,
    bestStreakDays: 12,
    timeActiveHours: 14.2,
    timeActivePercent: 96,
  );

  /// Weekly goal: 5 sessions; completed days are M, T, W.
  /// 0 = rest, 1 = done, 2 = today (done), 3 = target, 4 = scheduled-rest
  static const List<({String label, int state})> weekDays = [
    (label: 'M', state: 1),
    (label: 'T', state: 1),
    (label: 'W', state: 2),
    (label: 'T', state: 3),
    (label: 'F', state: 4),
    (label: 'S', state: 0),
    (label: 'S', state: 0),
  ];

  static const int weeklyGoalSessions = 5;
  static const int weeklyCompletedSessions = 4;
  static const double weeklyProgressPercent = 80.0;

  static const String milestoneName = 'Consistency Titan Award';
  static const String milestoneSubtitle =
      'Only 2 workouts left to unlock level 4 badge';

  static const List<WorkoutSummary> recentWorkouts = [
    WorkoutSummary(
      title: 'Full Body Strength',
      timestamp: 'Yesterday, 5:30 PM',
      exerciseCount: 5,
      durationMinutes: 48,
      kcal: 380,
      type: WorkoutType.strength,
    ),
    WorkoutSummary(
      title: 'HIIT Cardio Blast',
      timestamp: 'Monday, Oct 22',
      exerciseCount: 4,
      durationMinutes: 32,
      kcal: 290,
      type: WorkoutType.cardio,
    ),
    WorkoutSummary(
      title: 'Legs & Core Power',
      timestamp: 'Saturday, Oct 20',
      exerciseCount: 6,
      durationMinutes: 52,
      kcal: 420,
      type: WorkoutType.flexibility,
    ),
  ];

  static const String trainerTip =
      'Hydrate 20 minutes prior to bench sets to maintain upper shoulder joint '
      'lubrication and peak torque.';

  // ---------------------------------------------------------------------------
  // Workouts screen sample data
  // ---------------------------------------------------------------------------
  static const workoutsWeekStats = WorkoutsWeekStats(
    completedSessions: 4,
    goalSessions: 5,
    totalTime: '3h 15m',
    timeVsLastWeek: '+25m vs last wk',
    streakDays: 5,
    bestStreakDays: 12,
  );

  static const List<String> workoutFilterCategories = [
    'All',
    'Strength',
    'Cardio',
    'HIIT',
    'Mobility',
  ];

  static const List<CompletedWorkoutSession> completedWorkoutSessions = [
    CompletedWorkoutSession(
      title: 'Push Day Hypertrophy',
      subtitle: 'Strength • Chest, Shoulders, Triceps',
      date: 'Today, 8:15 AM',
      category: 'strength',
      icon: Icons.fitness_center_rounded,
      metrics: [
        SessionMetric(label: 'Exercises', value: '6'),
        SessionMetric(
          label: 'Duration',
          value: '52m',
          valueColor: AppColors.tertiaryContainer,
        ),
        SessionMetric(
          label: 'Burned',
          value: '385 kcal',
          valueColor: AppColors.secondary,
        ),
        SessionMetric(
          label: 'Volume',
          value: '4,820 kg',
          valueColor: AppColors.primaryContainer,
        ),
      ],
      footerNote: 'New Bench 1RM PR! (102.5 kg)',
      footerIcon: Icons.military_tech_rounded,
      footerColor: AppColors.primaryContainer,
    ),
    CompletedWorkoutSession(
      title: 'Legs & Core Power',
      subtitle: 'Strength • Quads, Hamstrings, Abs',
      date: 'Tue, Oct 22',
      category: 'strength',
      icon: Icons.fitness_center_rounded,
      metrics: [
        SessionMetric(label: 'Exercises', value: '7'),
        SessionMetric(
          label: 'Duration',
          value: '58m',
          valueColor: AppColors.tertiaryContainer,
        ),
        SessionMetric(
          label: 'Burned',
          value: '440 kcal',
          valueColor: AppColors.secondary,
        ),
        SessionMetric(
          label: 'Volume',
          value: '6,150 kg',
          valueColor: AppColors.primaryContainer,
        ),
      ],
      footerNote: 'High exertive fatigue (RPE 8.5)',
      footerColor: AppColors.onSurfaceVariant,
    ),
    CompletedWorkoutSession(
      title: 'HIIT Cardio Interval',
      subtitle: 'Conditioning • Sprint Repeats & Row',
      date: 'Sun, Oct 20',
      category: 'hiit',
      icon: Icons.timer_outlined,
      metrics: [
        SessionMetric(label: 'Circuits', value: '5'),
        SessionMetric(
          label: 'Duration',
          value: '35m',
          valueColor: AppColors.tertiaryContainer,
        ),
        SessionMetric(
          label: 'Burned',
          value: '320 kcal',
          valueColor: AppColors.secondary,
        ),
        SessionMetric(
          label: 'Avg HR',
          value: '152 bpm',
          valueColor: AppColors.secondary,
        ),
      ],
      footerNote: 'Zone 4 Cardio: 18 mins',
      footerIcon: Icons.favorite_rounded,
      footerColor: AppColors.tertiaryContainer,
    ),
    CompletedWorkoutSession(
      title: 'Upper Body Pull Focus',
      subtitle: 'Strength • Back, Lats & Biceps',
      date: 'Fri, Oct 18',
      category: 'strength',
      icon: Icons.fitness_center_rounded,
      metrics: [
        SessionMetric(label: 'Exercises', value: '6'),
        SessionMetric(
          label: 'Duration',
          value: '48m',
          valueColor: AppColors.tertiaryContainer,
        ),
        SessionMetric(
          label: 'Burned',
          value: '360 kcal',
          valueColor: AppColors.secondary,
        ),
        SessionMetric(
          label: 'Volume',
          value: '4,200 kg',
          valueColor: AppColors.primaryContainer,
        ),
      ],
      footerNote: 'Target lat activation score: 94%',
      footerColor: AppColors.onSurfaceVariant,
    ),
  ];
}

class CompletedWorkoutSession {
  final String title;
  final String subtitle;
  final String date;
  final String category;
  final IconData icon;
  final List<SessionMetric> metrics;
  final String? footerNote;
  final IconData? footerIcon;
  final Color? footerColor;

  const CompletedWorkoutSession({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.category,
    required this.icon,
    required this.metrics,
    this.footerNote,
    this.footerIcon,
    this.footerColor,
  });
}

class SessionMetric {
  final String label;
  final String value;
  final Color? valueColor;

  const SessionMetric({
    required this.label,
    required this.value,
    this.valueColor,
  });
}

class WorkoutsWeekStats {
  final int completedSessions;
  final int goalSessions;
  final String totalTime;
  final String timeVsLastWeek;
  final int streakDays;
  final int bestStreakDays;

  const WorkoutsWeekStats({
    required this.completedSessions,
    required this.goalSessions,
    required this.totalTime,
    required this.timeVsLastWeek,
    required this.streakDays,
    required this.bestStreakDays,
  });
}

