import 'package:flutter_test/flutter_test.dart';

import 'package:responsi/main.dart';

void main() {
  testWidgets('menampilkan halaman login Keripikroll', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false));

    expect(find.text('Keripikroll'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
