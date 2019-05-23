// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:birb/posts_list.dart';
import 'package:birb/sign_in_fab.dart';
import 'package:birb/main.dart';

void main() {
  testWidgets('Renders content', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('Birb'), findsOneWidget);
    expect(find.byType(PostsList), findsOneWidget);
    expect(find.byType(SignInFab), findsOneWidget);
  });
}
