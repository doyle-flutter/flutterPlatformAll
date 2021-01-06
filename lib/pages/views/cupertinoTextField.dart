import 'package:flutter/cupertino.dart';

// // main.dart에 입력해주세요
// void main() => runApp(CupertinoApp(home: CuperTxt()));

class CuperTxt extends StatelessWidget{
  final TextEditingController _tct = new TextEditingController(text:"");
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("CupertinoTextField")),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                child: CupertinoTextField(
                  controller: _tct,
                  clearButtonMode: OverlayVisibilityMode.editing, 
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.activeGreen),
                  ),
                  onEditingComplete: _subMit
                )
              ),
              CupertinoButton(
                child: Text("Check"),
                onPressed: _subMit
              )
            ]
          )
        ),
      )
    );
  }
  
  void _subMit(){
    if(_tct.text.isEmpty) return print("입력해주세요");
    print("입력한 데이터 : ${_tct.text}");
    return _tct.clear();
  }
}
