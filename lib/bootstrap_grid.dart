library bootstrap_grid;

import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

part 'src/row.dart';
part 'src/column.dart';
part 'src/list.dart';

enum _GridTier { xs, sm, md, lg, xl, xxl }

_GridTier _currentTier(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  double width = mediaQueryData.size.width;

  if (width < (Breakpoints.small.beginWidth ?? 576)) {
    return _GridTier.xs;
  } else if (width < (Breakpoints.medium.beginWidth ?? 768)) {
    return _GridTier.sm;
  } else if (width < (Breakpoints.mediumLarge.beginWidth ?? 992)) {
    return _GridTier.md;
  } else if (width < (Breakpoints.large.beginWidth ?? 1200)) {
    return _GridTier.lg;
  } else if (width < (Breakpoints.extraLarge.beginWidth ?? 1600)) {
    return _GridTier.xl;
  } else {
    return _GridTier.xxl;
  }
}

//
// responsive grid list
//


