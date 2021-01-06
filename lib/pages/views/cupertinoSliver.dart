import 'package:flutter/cupertino.dart';

// // main.dart 파일에 작성해주세요 
// // void main() => runApp(CupertinoApp(home: CuperTxt()));

class CuperTxt extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            middle: Text("SliverAppBarTitle"),
            largeTitle: Text("SliverTitle")
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Container(
                color: CupertinoColors.systemGrey3, 
                child: Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      color: CupertinoColors.systemRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0
                    )
                  )
                )
              ),
              childCount: 10
            )
          )
        ]
      )
    );
  }
}