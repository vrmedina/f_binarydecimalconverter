// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_template_conversor_decimal_binario_2022/ui/screens/my_app.dart';
import 'package:f_template_conversor_decimal_binario_2022/ui/widgets/binary_decimal.dart';
import 'package:f_template_conversor_decimal_binario_2022/ui/widgets/decimal_binary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Binary to Decimal', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: BinaryToDecimal())));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.byKey(const Key('1')), findsOneWidget);
    expect(find.byKey(const Key('0')), findsOneWidget);

    await tester.tap(find.byKey(const Key('1')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('1')));
    await tester.pump();

    expect(find.text('11'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset')));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(3));
  });

  testWidgets('Decimal to Binary', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: DecimalToBinary())));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byKey(const Key("1")));
    await tester.pump();
    await tester.tap(find.byKey(const Key("2")));
    await tester.pump();

    expect(find.text('12'), findsOneWidget);
    expect(find.text('1100'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset')));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(3));
  });

  testWidgets('Switch widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.byKey(const Key("1")), findsOneWidget);
    expect(find.byKey(const Key("0")), findsOneWidget);
    expect(find.byKey(const Key("2")), findsNothing);

    await tester.tap(find.byKey(const Key("switch")));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
  });
}
