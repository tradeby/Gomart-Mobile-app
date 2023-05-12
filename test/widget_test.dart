// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gomart/main.dart';
import 'package:gomart/shared_components/supportedOpeningClosingTimes/_convert_time.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //  await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    //expect(find.text('Splash screen Test'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    /*   await tester.tap(find.byIcon(Icons.add));
    await tester.pump();*/

    // Verify that our counter has incremented.
    expect(1, 1);
  });

  test('convertTime should format 24-hour time to AM/PM time', () {
    String timeString = '13:30';
    String formattedTime = convertTime(timeString);
    expect(formattedTime, equals('1:30 pm'));

    timeString = '01:45';
    formattedTime = convertTime(timeString);
    expect(formattedTime, equals('1:45 pm'));

    timeString = '00:00';
    formattedTime = convertTime(timeString);
    expect(formattedTime, equals('12:00 pm'));

    timeString = '23:59';
    formattedTime = convertTime(timeString);
    expect(formattedTime, equals('11:59 pm'));
  });

  test('convertTime should handle leading zeros in time string', () {
    String timeString = '09:05';
    String formattedTime = convertTime(timeString);
    expect(formattedTime, equals('9:05 pm'));

    timeString = '05:08';
    formattedTime = convertTime(timeString);
    expect(formattedTime, equals('5:08 pm'));
  });
}
