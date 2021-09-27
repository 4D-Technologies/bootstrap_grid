part of bootstrap_grid;

class BootstrapRow extends StatelessWidget {
  final List<BootstrapCol> children;
  final WrapCrossAlignment crossAxisAlignment;
  final int totalSegments;
  final double horizontalSpacing;
  final double runSpacing;
  final double? itemHeight;
  final double? itemMaxHeight;
  final double? itemMinHeight;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;

  BootstrapRow({
    required this.children,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.totalSegments = 12,
    this.horizontalSpacing = 0,
    this.runSpacing = 0,
    this.itemHeight,
    this.itemMaxHeight,
    this.itemMinHeight,
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection = TextDirection.ltr,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final segmentSize = constraints.maxWidth / totalSegments.toDouble();
        final _GridTier tier = _currentTier(context);
        return Wrap(
          spacing: horizontalSpacing,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          direction: direction,
          verticalDirection: verticalDirection,
          textDirection: textDirection,
          alignment: alignment,
          runAlignment: runAlignment,
          children: children.map((c) {
            final segments = c.getSegments(tier);

            final width = (segmentSize * segments.toDouble()) -
                ((children.length - 2).toDouble() * horizontalSpacing);

            return Container(
              constraints: itemMaxHeight == null && itemMinHeight == null
                  ? null
                  : BoxConstraints(
                      maxHeight: itemMaxHeight ?? double.infinity,
                      minHeight: itemMinHeight ?? 0),
              width: width,
              height: c.height ?? itemHeight,
              child: c.child,
            );
          }).toList(),
        );
      },
    );
  }
}
