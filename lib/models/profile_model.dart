/// Profile data models and static sample data for FitTrack.
class UserProfile {
  final String name;
  final bool isVerified;
  final String subtitle;
  final String email;
  final int totalWorkouts;
  final int streakDays;
  final int bestStreakDays;
  final double totalTimeHours;
  final String timeDelta;
  final String primaryFocus;
  final int completedSessions;
  final int totalSessions;
  final String goalDescription;
  final String fitnessLevel;
  final String preferredStyle;
  final String weeklyTarget;
  final String bodyWeight;
  final String appVersion;

  const UserProfile({
    required this.name,
    this.isVerified = true,
    required this.subtitle,
    required this.email,
    required this.totalWorkouts,
    required this.streakDays,
    required this.bestStreakDays,
    required this.totalTimeHours,
    required this.timeDelta,
    required this.primaryFocus,
    required this.completedSessions,
    required this.totalSessions,
    required this.goalDescription,
    required this.fitnessLevel,
    required this.preferredStyle,
    required this.weeklyTarget,
    required this.bodyWeight,
    required this.appVersion,
  });

  double get goalProgress =>
      totalSessions > 0 ? completedSessions / totalSessions : 0.0;
}

class SampleProfile {
  SampleProfile._();

  static const user = UserProfile(
    name: 'Alex Morgan',
    isVerified: true,
    subtitle: 'Intermediate Athlete • Member since Jan 2024',
    email: 'alex.morgan@fitmail.com',
    totalWorkouts: 74,
    streakDays: 5,
    bestStreakDays: 12,
    totalTimeHours: 48.5,
    timeDelta: '+3.2h',
    primaryFocus: 'Hypertrophy & Strength',
    completedSessions: 4,
    totalSessions: 5,
    goalDescription:
        'Maintain 4–5x weekly consistency, progressive overload on compound lifts, and focus on leg hypertrophy.',
    fitnessLevel: 'Intermediate',
    preferredStyle: 'Hypertrophy',
    weeklyTarget: '5 Days / Week',
    bodyWeight: '68.5 kg',
    appVersion: 'v2.4.1',
  );
}
