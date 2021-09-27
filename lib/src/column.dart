part of bootstrap_grid;

class BootstrapCol {
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int? xxl;
  final Widget child;
  final double? height;

  const BootstrapCol({
    this.xs = 12,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.height,
    required this.child,
  });

  int getSegments(_GridTier tier) {
    switch (tier) {
      case _GridTier.xs:
        return xs;
      case _GridTier.sm:
        return sm ?? xs;
      case _GridTier.md:
        return md ?? sm ?? xs;
      case _GridTier.lg:
        return lg ?? md ?? sm ?? xs;
      case _GridTier.xl:
        return xl ?? lg ?? md ?? sm ?? xs;
      case _GridTier.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs;
    }
  }
}
