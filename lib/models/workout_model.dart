// Static sample data used across the Home dashboard.
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
}
