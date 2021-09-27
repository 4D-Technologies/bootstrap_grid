library bootstrap_grid;

import 'package:flutter/widgets.dart';

part 'src/row.dart';
part 'src/column.dart';
part 'src/list.dart';

enum _GridTier { xs, sm, md, lg, xl, xxl }

_GridTier _currentTier(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  double width = mediaQueryData.size.width;

  if (width < 576) {
    return _GridTier.xs;
  } else if (width < 768) {
    return _GridTier.sm;
  } else if (width < 992) {
    return _GridTier.md;
  } else if (width < 1200) {
    return _GridTier.lg;
  } else if (width < 1600) {
    return _GridTier.xl;
  } else {
    return _GridTier.xxl;
  }
}

//
// responsive grid list
//


