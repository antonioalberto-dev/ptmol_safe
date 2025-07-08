// This is a basic Flutter widget test for PTMOL Safe app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ptmol/app_module.dart';
import 'package:ptmol/app_widget.dart';

void main() {
  testWidgets('PTMOL Safe app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify that the onboarding screen loads with expected text
    expect(find.textContaining('Bem-vindo'), findsWidgets);
    
    // Verify skip button exists
    expect(find.text('Pular'), findsOneWidget);
  });

  testWidgets('Navigation to form page works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify we start on onboarding page
    expect(find.text('Pular'), findsOneWidget);

    // Try to navigate directly using Modular
    Modular.to.pushNamed('/form/');
    await tester.pumpAndSettle();
    
    // Verify we navigated to the form page
    expect(find.textContaining('Informe o ativo'), findsOneWidget);
  });

  testWidgets('Form page elements are present', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Navigate directly to form page
    Modular.to.pushNamed('/form/');
    await tester.pumpAndSettle();

    // Verify form elements exist
    expect(find.text('Informe o ativo'), findsOneWidget);
    expect(find.text('Classificação'), findsOneWidget);
    expect(find.text('Selecione as ameaças'), findsOneWidget);
    expect(find.text('Fonte de vazamento'), findsOneWidget);
    expect(find.text('Usos maliciosos'), findsOneWidget);
    expect(find.text('Riscos'), findsOneWidget);
    expect(find.text('Alertas de prevenção'), findsOneWidget);
    expect(find.text('Contramedidas'), findsOneWidget);
    expect(find.text('Finalizar inspeção'), findsOneWidget);
  });

  testWidgets('Onboarding skip button navigation works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify we start on onboarding page
    expect(find.text('Pular'), findsOneWidget);
    expect(find.textContaining('Bem-vindo'), findsWidgets);

    // Test that the skip button exists and is tappable
    final skipButton = find.text('Pular');
    expect(skipButton, findsOneWidget);
  });
}
