import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/main.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/screens/exercises_screen.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/screens/profile_screen.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/theme/app_theme.dart';

void main() {
  testWidgets('FitTrackApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FitTrackApp());
    expect(find.text('FITTRACK'), findsWidgets);
  });

  testWidgets('ExercisesScreen displays exercise library and items',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildAppTheme(),
        home: const ExercisesScreen(),
      ),
    );

    expect(find.text('Exercise Library'), findsOneWidget);
    expect(find.text('Custom Movement'), findsOneWidget);
    expect(find.text('Barbell Bench Press'), findsOneWidget);
    expect(find.text('DAILY SUGGESTION'), findsOneWidget);
    expect(find.text('Full-Body Dynamic Primer'), findsOneWidget);
  });

  testWidgets('ExercisesScreen filters by search and category chip',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildAppTheme(),
        home: const ExercisesScreen(),
      ),
    );

    // Search for Squats
    await tester.enterText(find.byType(TextField), 'Squats');
    await tester.pump();

    expect(find.text('Barbell Back Squats'), findsOneWidget);
    expect(find.text('Barbell Bench Press'), findsNothing);

    // Clear search
    await tester.enterText(find.byType(TextField), '');
    await tester.pump();

    expect(find.text('Barbell Bench Press'), findsOneWidget);

    // Filter by Back
    await tester.tap(find.text('Back'));
    await tester.pump();

    expect(find.text('Lat Pulldown'), findsOneWidget);
    expect(find.text('Push-ups'), findsNothing);

    // Filter back to All
    await tester.tap(find.text('All'));
    await tester.pump();

    expect(find.text('Barbell Bench Press'), findsOneWidget);
    expect(find.text('Push-ups'), findsOneWidget);
  });

  testWidgets('ProfileScreen displays profile details, goals, and settings',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: buildAppTheme(),
        home: const ProfileScreen(),
      ),
    );

    // Profile header
    expect(find.text('Alex Morgan'), findsOneWidget);
    expect(find.text('Intermediate Athlete • Member since Jan 2024'),
        findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);

    // Stats
    expect(find.text('74'), findsOneWidget);
    expect(find.text('Workouts'), findsOneWidget);

    // Goal
    expect(find.text('PRIMARY FOCUS'), findsOneWidget);
    expect(find.text('Hypertrophy & Strength'), findsOneWidget);
    expect(find.text('4 of 5 sessions'), findsOneWidget);

    // Athletic Profile
    expect(find.text('ATHLETIC PROFILE'), findsOneWidget);
    expect(find.text('Fitness Level'), findsOneWidget);
    expect(find.text('68.5 kg'), findsOneWidget);

    // Settings & Actions
    expect(find.text('PREFERENCES & SETTINGS'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('Units of Measure'), findsOneWidget);
    expect(find.text('Sign Out'), findsOneWidget);
  });
}
