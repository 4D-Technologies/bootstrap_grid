part of '../bootstrap_grid.dart';

class BootstrapList extends StatelessWidget {
  final double? desiredItemWidth, minSpacing;
  final List<Widget>? children;
  final bool squareCells, scroll;
  final MainAxisAlignment rowMainAxisAlignment;

  const BootstrapList(
      {super.key,
      this.desiredItemWidth,
      this.minSpacing,
      this.squareCells = false,
      this.scroll = true,
      this.children,
      this.rowMainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final List<Widget>? items = children;
        if (items == null || items.isEmpty) {
          return const SizedBox.shrink();
        }

        double width = constraints.maxWidth;

        double N = (width - minSpacing!) / (desiredItemWidth! + minSpacing!);

        int n;
        double? spacing, itemWidth;

        if (N % 1 == 0) {
          n = N.floor();
          spacing = minSpacing;
          itemWidth = desiredItemWidth;
        } else {
          n = N.floor();

          double dw =
              width - (n * (desiredItemWidth! + minSpacing!) + minSpacing!);

          itemWidth = desiredItemWidth! +
              (dw / n) *
                  (desiredItemWidth! / (desiredItemWidth! + minSpacing!));

          spacing = (width - itemWidth * n) / (n + 1);
        }

        if (scroll) {
          return ListView.builder(
              itemCount: (items.length / n).ceil() * 2 - 1,
              itemBuilder: (context, index) {
                if (index % 2 == 1) {
                  return SizedBox(
                    height: minSpacing,
                  );
                }
                var rowChildren = List<Widget>.empty(growable: true);
                index = index ~/ 2;
                for (int i = index * n; i < (index + 1) * n; i++) {
                  if (i >= items.length) break;
                  rowChildren.add(items[i]);
                }
                return _BootstrapListItem(
                  mainAxisAlignment: rowMainAxisAlignment,
                  itemWidth: itemWidth,
                  spacing: spacing,
                  squareCells: squareCells,
                  children: rowChildren,
                );
              });
        } else {
          var rows = List<Widget>.empty(growable: true);
          rows.add(SizedBox(
            height: minSpacing,
          ));
          for (int j = 0; j < (items.length / n).ceil(); j++) {
            var rowChildren = List<Widget>.empty(growable: true);
            for (int i = j * n; i < (j + 1) * n; i++) {
              if (i >= items.length) break;
              rowChildren.add(items[i]);
            }
            //
            rows.add(_BootstrapListItem(
              mainAxisAlignment: rowMainAxisAlignment,
              itemWidth: itemWidth,
              spacing: spacing,
              squareCells: squareCells,
              children: rowChildren,
            ));

            rows.add(SizedBox(
              height: minSpacing,
            ));
          }

          return Column(
            children: rows,
          );
        }
      },
    );
  }
}

class _BootstrapListItem extends StatelessWidget {
  final double? spacing, itemWidth, itemHeight;
  final List<Widget>? children;
  final bool? squareCells;
  final MainAxisAlignment mainAxisAlignment;

  const _BootstrapListItem(
      {this.itemWidth,
      this.spacing,
      this.squareCells,
      double? itemHeight,
      this.children,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : itemHeight = itemHeight ?? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    var list = List<Widget>.empty(growable: true);

    list.add(SizedBox(
      width: spacing,
    ));

    for (var child in children!) {
      list.add(SizedBox(
        width: itemWidth,
        height: squareCells! ? itemWidth : itemHeight,
        child: child,
      ));
      list.add(SizedBox(
        width: spacing,
      ));
    }

    return list;
  }
}
