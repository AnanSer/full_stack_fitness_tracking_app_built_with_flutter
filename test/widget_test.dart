import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/main.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/screens/exercises_screen.dart';
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
}
