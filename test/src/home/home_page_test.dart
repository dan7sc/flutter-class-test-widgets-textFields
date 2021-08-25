import 'package:aula_textfield2/main.dart';
import 'package:aula_textfield2/src/shared/widgets/shared_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage should have title "Cadastro Academy"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text("Cadastro Academy"), findsOneWidget);
  });

  testWidgets('HomePage should have Nome', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.widgetWithText(CustomTextField, 'Nome'), findsNothing);
  });
}
