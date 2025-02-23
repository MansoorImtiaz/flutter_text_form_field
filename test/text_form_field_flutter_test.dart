import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_form_field_flutter/text_form_field_flutter.dart';

void main() {
  testWidgets('FlutterTextFormField displays label and hint text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormFieldFlutter(
            labelText: 'Email',
            hintText: 'Enter your email',
          ),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
  });

  testWidgets('FlutterTextFormField shows error text when validation fails', (WidgetTester tester) async {
    late GlobalKey<FormState> formKey;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            formKey = GlobalKey<FormState>();
            return Scaffold(
              body: Form(
                key: formKey,
                child: TextFormFieldFlutter(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  validator: (value) => 'Please enter email',
                ),
              ),
            );
          },
        ),
      ),
    );

    // Initial state should have no error
    expect(find.text('Please enter email'), findsNothing);

    // Trigger validation
    formKey.currentState!.validate();
    await tester.pumpAndSettle();

    // Now we should see the error
    expect(find.text('Please enter email'), findsOneWidget);
  });

  testWidgets('FlutterTextFormField handles text input', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormFieldFlutter(
            labelText: 'Email',
            hintText: 'Enter your email',
            controller: controller,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'test@example.com');
    expect(controller.text, 'test@example.com');
  });

  testWidgets('FlutterTextFormField shows icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextFormFieldFlutter(
            labelText: 'Search',
            hintText: 'Search here',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.clear),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.clear), findsOneWidget);
  });
}