import 'package:bootstrap_grid/bootstrap_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Key colKey = Key('col');

  Future<double> pumpColWidth(
    WidgetTester tester, {
    required double width,
    required BootstrapCol col,
  }) async {
    tester.view.physicalSize = Size(width, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: Size(width, 800)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            width: width,
            height: 800,
            child: BootstrapRow(children: <BootstrapCol>[col]),
          ),
        ),
      ),
    );

    return tester.getSize(find.byKey(colKey)).width;
  }

  testWidgets('selects Bootstrap column spans from local width breakpoints',
      (WidgetTester tester) async {
    const BootstrapCol col = BootstrapCol(
      xs: 12,
      sm: 6,
      md: 4,
      lg: 3,
      xl: 2,
      xxl: 1,
      child: SizedBox(key: colKey, height: 10),
    );

    Future<void> expectSegments(double width, int segments) async {
      final double actual = await pumpColWidth(
        tester,
        width: width,
        col: col,
      );
      expect(
        actual,
        closeTo(width * segments / 12, 0.001),
        reason: 'width $width should use $segments segments',
      );
    }

    await expectSegments(575, 12); // xs
    await expectSegments(576, 6); // sm
    await expectSegments(767, 6); // sm
    await expectSegments(768, 4); // md
    await expectSegments(991, 4); // md
    await expectSegments(992, 3); // lg
    await expectSegments(1199, 3); // lg
    await expectSegments(1200, 2); // xl
    await expectSegments(1599, 2); // xl
    await expectSegments(1600, 1); // xxl
  });

  testWidgets('falls back to the next smaller defined column span',
      (WidgetTester tester) async {
    const BootstrapCol col = BootstrapCol(
      xs: 12,
      md: 6,
      xl: 3,
      child: SizedBox(key: colKey, height: 10),
    );

    Future<void> expectSegments(double width, int segments) async {
      final double actual = await pumpColWidth(
        tester,
        width: width,
        col: col,
      );
      expect(actual, closeTo(width * segments / 12, 0.001));
    }

    await expectSegments(500, 12); // xs
    await expectSegments(600, 12); // sm falls back to xs
    await expectSegments(800, 6); // md
    await expectSegments(1000, 6); // lg falls back to md
    await expectSegments(1300, 3); // xl
    await expectSegments(1800, 3); // xxl falls back to xl
  });
}
