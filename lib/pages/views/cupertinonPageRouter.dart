// // Null-Safety 미적용
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// // main.dart 파일에 작성해야합니다
// void main() => runApp(CupertinoApp(home: CupertinoPage1()));

// Cupertino Page Router
class CupertinoPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Page1")),
      child: Center(
        child: CupertinoButton(
          child: Text("Move"),
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => CupertinoPage1()
            )
          )
        ),
      )
    );
  }  
}

class CupertinoPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Page2")),
      child: Center(
        child: CupertinoButton(
          child: Text("POP"),
          onPressed: () => Navigator.of(context).pop()
        ),
      )
    );
  }
}

// Material Page Router
class MaterialPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("M_Page1")),
      body: Center(
        child: TextButton(
          child: Text("Move"),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => MaterialPage2()
            )
          )
        )
      )
    );
  }
}

class MaterialPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("M_Page2")),
      body: Center(
        child: TextButton(
          child: Text("POP"),
          onPressed: () => Navigator.of(context).pop()
        )
      )
    );
  }
}

// // Null-Safety 적용
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(CupertinoApp(home: CupertinoPage1()));

// // Cupertino Page Router
// class CupertinoPage1 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(middle: Text("Page1")),
//       child: Center(
//         child: CupertinoButton(
//           child: Text("Move"),
//           onPressed: () => Navigator.of(context)!.push(
//             CupertinoPageRoute<void>(
//               builder: (BuildContext context) => CupertinoPage1()
//             )
//           )
//         ),
//       )
//     );
//   }  
// }

// class CupertinoPage2 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(middle: Text("Page2")),
//       child: Center(
//         child: CupertinoButton(
//           child: Text("POP"),
//           onPressed: () => Navigator.of(context)!.pop()
//         ),
//       )
//     );
//   }
// }

// // Material Page Router
// class MaterialPage1 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("M_Page1")),
//       body: Center(
//         child: TextButton(
//           child: Text("Move"),
//           onPressed: () => Navigator.of(context)!.push(
//             MaterialPageRoute(
//               builder: (BuildContext context) => MaterialPage2()
//             )
//           )
//         )
//       )
//     );
//   }
// }

// class MaterialPage2 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("M_Page2")),
//       body: Center(
//         child: TextButton(
//           child: Text("POP"),
//           onPressed: () => Navigator.of(context)!.pop()
//         )
//       )
//     );
//   }
// }

