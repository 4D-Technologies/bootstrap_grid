library bootstrap_grid;

import 'package:flutter/widgets.dart';

part 'src/row.dart';
part 'src/column.dart';
part 'src/list.dart';

enum _GridTier { xs, sm, md, lg, xl, xxl }

/// Bootstrap-style minimum widths for each grid tier, in logical pixels.
///
/// Flutter does not ship a first-party window-size-class API, so these values
/// live in this package instead of pulling in `flutter_adaptive_scaffold`.
abstract final class _Breakpoints {
  static const double sm = 576;
  static const double md = 768;
  static const double lg = 992;
  static const double xl = 1200;
  static const double xxl = 1600;
}

_GridTier _currentTier(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;

  if (width < _Breakpoints.sm) {
    return _GridTier.xs;
  } else if (width < _Breakpoints.md) {
    return _GridTier.sm;
  } else if (width < _Breakpoints.lg) {
    return _GridTier.md;
  } else if (width < _Breakpoints.xl) {
    return _GridTier.lg;
  } else if (width < _Breakpoints.xxl) {
    return _GridTier.xl;
  } else {
    return _GridTier.xxl;
  }
}
