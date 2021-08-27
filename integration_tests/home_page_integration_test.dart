import 'package:aula_textfield2/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// execute tests with the command:
// > flutter drive --driver=test_driver/integration_driver.dart
//                 --target=integration_tests/home_page_integration_test.dart

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('description', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(true, true);
  });
}
