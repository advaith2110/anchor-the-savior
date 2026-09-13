import 'package:flutter_test/flutter_test.dart';

import 'package:anchor/main.dart';

void main() {
  testWidgets('Anchor app shows the welcome experience', (WidgetTester tester) async {
    await tester.pumpWidget(const AnchorApp());

    expect(find.text('ANCHOR'), findsOneWidget);
    expect(find.text('Panic mode'), findsOneWidget);
  });
}
