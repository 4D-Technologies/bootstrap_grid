import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap_grid/bootstrap_grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Grid List",
              icon: Icon(Icons.table_chart),
            ),
            Tab(
              text: "Row",
              icon: Icon(Icons.table_rows),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            _buildGridList(),
            _buildRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow() {
    return Column(children: [
      BootstrapRow(
        horizontalSpacing: 5,
        runSpacing: 5,
        itemHeight: 150,
        children: [
          BootstrapCol(
            xs: 12,
            md: 8,
            lg: 6,
            xl: 4,
            xxl: 2,
            child: Container(
              color: Colors.blue.shade50,
              child: Text("Row 1, Col 1"),
            ),
          ),
          BootstrapCol(
            xs: 12,
            md: 4,
            lg: 6,
            xl: 4,
            xxl: 3,
            child: Container(
              color: Colors.red.shade50,
              child: Text("Row 1, Col 2"),
            ),
          ),
          BootstrapCol(
            xs: 12,
            md: 8,
            lg: 6,
            xl: 4,
            xxl: 6,
            child: Container(
              color: Colors.green.shade50,
              child: Text("Row 1, Col 3"),
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.purple,
        height: 10,
        thickness: 3,
      ),
      BootstrapRow(
          horizontalSpacing: 5,
          runSpacing: 5,
          itemHeight: 100,
          children: [
            BootstrapCol(
              xs: 12,
              md: 4,
              lg: 6,
              xl: 4,
              xxl: 4,
              child: Container(
                color: Colors.blue.shade200,
                child: Text("Row 2, Col 1"),
              ),
            ),
            BootstrapCol(
              xs: 12,
              md: 4,
              lg: 6,
              xl: 4,
              xxl: 3,
              child: Container(
                color: Colors.red.shade200,
                child: Text("Row 2, Col 2"),
              ),
            ),
            BootstrapCol(
              xs: 12,
              md: 4,
              lg: 6,
              xl: 4,
              xxl: 5,
              child: Container(
                color: Colors.green.shade200,
                child: Text("Row 2, Col 3"),
              ),
            ),
          ]),
    ]);
  }

  Widget _buildGridList() {
    return BootstrapList(
        rowMainAxisAlignment: MainAxisAlignment.center,
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
        }).toList());
  }

//   Widget _buildGridLayout() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         BootstrapRow(
//           children: [
//             BootstrapCol(
//               lg: 12,
//               child: Container(
//                 height: 100,
//                 alignment: Alignment(0, 0),
//                 color: Colors.purple,
//                 child: Text("lg : 12"),
//               ),
//             ),
//             BootstrapCol(
//               xs: 6,
//               md: 3,
//               child: Container(
//                 height: 100,
//                 alignment: Alignment(0, 0),
//                 color: Colors.green,
//                 child: Text("xs : 6 \r\nmd : 3"),
//               ),
//             ),
//             BootstrapCol(
//               xs: 6,
//               md: 3,
//               child: Container(
//                 height: 100,
//                 alignment: Alignment(0, 0),
//                 color: Colors.orange,
//                 child: Text("xs : 6 \r\nmd : 3"),
//               ),
//             ),
//             BootstrapCol(
//               xs: 6,
//               md: 3,
//               child: Container(
//                 height: 100,
//                 alignment: Alignment(0, 0),
//                 color: Colors.red,
//                 child: Text("xs : 6 \r\nmd : 3"),
//               ),
//             ),
//             BootstrapCol(
//               xs: 6,
//               md: 3,
//               child: Container(
//                 height: 100,
//                 alignment: Alignment(0, 0),
//                 color: Colors.blue,
//                 child: Text("xs : 6 \r\nmd : 3"),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildGridLayout_testCrossAlign() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         BootstrapRow(
//           children: [
//             BootstrapCol(
//               xs: 6,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 100,
//                     color: Colors.blue,
//                     margin: EdgeInsets.all(10),
//                   ), // height 100px
//                   Container(
//                     height: 100,
//                     color: Colors.blueGrey,
//                     margin: EdgeInsets.all(10),
//                   ) // height 100px
//                 ],
//               ),
//             ),
//             BootstrapCol(
//               xs: 6,
//               child: Container(
//                 height: 400,
//                 color: Colors.black45,
//                 margin: EdgeInsets.all(10),
//               ), // height 500px
//             )
//           ],
//         ),
//       ],
//     );
//   }
}
