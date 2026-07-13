import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/responsive/responsive.dart';

Widget _sized(Widget child, double width) => MediaQuery(
      data: MediaQueryData(size: Size(width, 800)),
      child: child,
    );

void main() {
  testWidgets('resolves breakpoint by width', (WidgetTester tester) async {
    await tester.pumpWidget(
      _sized(const ResponsiveLayout(mobile: Placeholder()), 400),
    );
    expect(
      AppResponsive.isMobile(tester.element(find.byType(ResponsiveLayout))),
      isTrue,
    );

    await tester.pumpWidget(
      _sized(const ResponsiveLayout(mobile: Placeholder()), 700),
    );
    expect(
      AppResponsive.isTablet(tester.element(find.byType(ResponsiveLayout))),
      isTrue,
    );

    await tester.pumpWidget(
      _sized(const ResponsiveLayout(mobile: Placeholder()), 1200),
    );
    expect(
      AppResponsive.isDesktop(tester.element(find.byType(ResponsiveLayout))),
      isTrue,
    );
  });

  test('gridColumns scales with breakpoint', () {
    expect(AppResponsive.gridColumnsFor(AppBreakpoint.mobile), 2);
    expect(AppResponsive.gridColumnsFor(AppBreakpoint.tablet), 3);
    expect(AppResponsive.gridColumnsFor(AppBreakpoint.desktop), 4);
  });
}
