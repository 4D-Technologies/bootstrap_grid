# bootstrap_grid

Responsive Grid Layout and List for Flutter - Forked and improved

This package has no third-party layout dependencies. Grid tiers use Bootstrap-style width breakpoints from `MediaQuery`.

## Breakpoints

`BootstrapCol` spans are selected from the current window width:

| Tier | Minimum width |
| --- | --- |
| `xs` | `< 576` |
| `sm` | `≥ 576` |
| `md` | `≥ 768` |
| `lg` | `≥ 992` |
| `xl` | `≥ 1200` |
| `xxl` | `≥ 1600` |

Unset larger tiers fall back to the next smaller defined span.

## Responsive Grid Layout

With `BootstrapRow` and `BootstrapCol` you can get the same behavior of [bootstrap](https://getbootstrap.com) Grid System

Give every col the width it shall occupy at every size category assuming the total width is 12

```dart
        BootstrapRow(
          children: [
            BootstrapCol(
              lg: 12,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.purple,
                child: Text("lg : 12"),
              ),
            ),
            BootstrapCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.green,
                child: Text("xs : 6 \r\nmd : 3"),
              ),
            ),
            BootstrapCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.orange,
                child: Text("xs : 6 \r\nmd : 3"),
              ),
            ),
            BootstrapCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.red,
                child: Text("xs : 6 \r\nmd : 3"),
              ),
            ),
            BootstrapCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.blue,
                child: Text("xs : 6 \r\nmd : 3"),
              ),
            ),
        )

```

<img src="https://raw.githubusercontent.com/mohamed-selim-a/ResponsiveGrid_Flutter/master/images/1.jpg" width="300"> <img src="https://raw.githubusercontent.com/mohamed-selim-a/ResponsiveGrid_Flutter/master/images/2.jpg" height="300">

## Responsive Grid List

`BootstrapList` works differently in that you only specify a desired width for the items and spacing, and it will decide how many items shall fit in a line, and the width of the item and spacing will change (only small change) to fill the entire width

```dart
    BootstrapList(
        desiredItemWidth: 100,
        minSpacing: 10,
        children: [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20
        ].map((i) {
          return Container(
            height: 100,
            alignment: Alignment(0, 0),
            color: Colors.cyan,
            child: Text(i.toString()),
          );
        }).toList()
    )

```

<img src="https://raw.githubusercontent.com/mohamed-selim-a/ResponsiveGrid_Flutter/master/images/3.jpg" width="300"> <img src="https://raw.githubusercontent.com/mohamed-selim-a/ResponsiveGrid_Flutter/master/images/4.jpg" height="300">
