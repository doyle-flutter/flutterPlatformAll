import 'package:flutter/material.dart';

// main.dart 파일에 작성해야합니다
// void main() => runApp(MaterialApp(home: Page1(),));

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () async{
            // Custom Route Animation
            // // - Nul-Safety 적용 코드
            // await Navigator.of(context)!.push(_createRoute());
            // // - Nul-Safety 미적용 코드
            await Navigator.of(context).push(_createRoute());
            
            // Custom Dialog POPUP
            await showGeneralDialog<void>(
              context: context,
              pageBuilder: _createPopUp,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black54,
              useRootNavigator: true,
              transitionDuration: const Duration(milliseconds: 150),
              transitionBuilder: _createPopUpFade,
            );
          },
        ),
      ),
    );
  }
}

Route<void> _createRoute() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, page2) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: page2,
      );
    },
  );

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
}

Widget _createPopUp(BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
  final Widget pageChild = Container(
    alignment: Alignment.center,
    child: Container(
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
      color: Colors.blue,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 24.0, color: Colors.white),
        child: Text("Custom POPUP")
      )
    )
  );
  Widget dialog = Builder( builder: (BuildContext context) => pageChild);
  return dialog;
}

Widget _createPopUpFade(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => FadeTransition(
  opacity: CurvedAnimation(
    parent: animation,
    curve: Curves.easeOut,
  ),
  child: child,
);