import 'package:flutter_test/flutter_test.dart';
import 'package:full_stack_fitness_tracking_app_built_with_flutter/main.dart';

void main() {
  testWidgets('FitTrackApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FitTrackApp());
    expect(find.text('FITTRACK'), findsWidgets);
  });
}
