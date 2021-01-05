import 'package:flutter/cupertino.dart';

// // main.dart에 작성되어야 합니다
// void main() => runApp(CupertinoApp(home: Page1()));

class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Page1")),
      child: Center(
        child: CupertinoButton(
          child: Text("Move"),
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => Page2()
            )
          )
        ),
      )
    );
  }  
}

class Page2 extends StatelessWidget{
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


// // Null-Safety 적용 코드
// import 'package:flutter/cupertino.dart';

// void main() => runApp(CupertinoApp(home: Page1()));

// class Page1 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(middle: Text("Page1")),
//       child: Center(
//         child: CupertinoButton(
//           child: Text("Move"),
//           onPressed: () => Navigator.of(context)!.push(
//             CupertinoPageRoute<void>(
//               builder: (BuildContext context) => Page2()
//             )
//           )
//         ),
//       )
//     );
//   }  
// }

// class Page2 extends StatelessWidget{
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