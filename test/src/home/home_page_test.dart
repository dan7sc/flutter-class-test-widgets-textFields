import 'package:aula_textfield2/main.dart';
import 'package:aula_textfield2/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage should have title "Cadastro Academy"',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text("Cadastro Academy"), findsOneWidget);
  });

  testWidgets('HomePage should have Nome', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.widgetWithText(CustomTextField, 'Nome'), findsOneWidget);
  });

  testWidgets('HomePage should have password and confirm password',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Original example: change label 'Confirmar Senha' to 'Senha'
    // expect(find.widgetWithText(CustomTextField, 'Senha'), findsNWidgets(2));

    expect(find.textContaining('Senha'), findsNWidgets(2));
  });

  testWidgets('HomePage should have raro logo', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byKey(Key('raroLogo')), findsNWidgets(1));
  });

  testWidgets('HomePage should have raro logo inside SingleChildScrollView',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(
        find.descendant(
            of: find.byType(SingleChildScrollView),
            matching: find.byKey(Key('raroLogo'))),
        findsNWidgets(1));
  });

  testWidgets('HomePage should have e-mail field',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Original example
    // expect(find.textContaining('mail'), findsOneWidget);

    expect(find.widgetWithText(CustomTextField, 'E-mail'), findsOneWidget);
  });
}
