// import 'package:flutter/material.dart';

// // * main 함수는 main.dart 파일에 있어야합니다 
// void main() {
//   runApp(MaterialApp(home: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("AppBar")),
//       body: Center(child: Text("HOME"))
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';

// // * main 함수는 main.dart 파일에 있어야합니다 
// void main() {
//   runApp(CupertinoApp(home: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text("AppBar"),
//         trailing: Text("TXT"),
//       ),
//       child: Center(child: Text("HOME"))
//     );
//   }
// }


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart'; // Navigator(화면이동) 를 위해 material 을 불러옵니다
// // * main 함수는 main.dart 파일에 있어야합니다 
// void main() {
//   runApp(CupertinoApp(home: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => CupertinoTabScaffold(
//   tabBar: CupertinoTabBar(
//     items: <BottomNavigationBarItem> [
//       BottomNavigationBarItem(icon: Icon(Icons.add),),
//       BottomNavigationBarItem(icon: Icon(Icons.settings),),
//     ],
//   ),
//   tabBuilder: (BuildContext context, int index) => CupertinoTabView(
//       builder: (BuildContext context) => CupertinoPageScaffold(
//           navigationBar: CupertinoNavigationBar( middle: Text('Page 1 of tab $index'),),
//           child: Center(
//             child: CupertinoButton(
//               child: Text('Next page'),
//               onPressed: () {
//                 Navigator.of(context)?.push(
//                   CupertinoPageRoute<void>(
//                     builder: (BuildContext context) => CupertinoPageScaffold(
//                      navigationBar: CupertinoNavigationBar(
//                        middle: Text('Page 2 of tab $index'),
//                      ),
//                      child: Center(
//                       child: CupertinoButton(
//                         child: const Text('Back'),
//                         onPressed: () => Navigator.of(context)?.pop(),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     ),
//   );
// }


