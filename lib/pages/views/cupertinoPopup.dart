import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// // main.dart 파일에 작성되어야 합니다
// void main() {
//   runApp(CupertinoApp(home: CupertinoPopUp()));
// }

// // Dart nullSafety 가 적용되어있습니다
class CupertinoPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("AppBar"),
        trailing: TextButton(
          child: Text("Setting"),
          onPressed: () async{
            // (1) showCupertinoDialog - CupertinoAlertDialog
            await showCupertinoDialog<void>(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text("쿠퍼티노 팝업"),
                content: Text("팝업 콘텐츠"),
                actions: [
                  // nullSafaty 적용 된 내용
                  // TextButton(child: Text("닫기"),onPressed: () => Navigator.of(context)!.pop())
                  
                  // nullSafaty 미적용
                  TextButton(child: Text("닫기"),onPressed: () => Navigator.of(context).pop())
                ]
              )
            );
            
            // (2) showCupertinoModalPopup - CupertinoActionSheet
            await showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: Text("액션 타이틀"),
                actions: [
                  CupertinoActionSheetAction(
                    child: Text("액션 1"),
                    onPressed: () => print("Action 1")
                  ),
                  CupertinoActionSheetAction(
                    child: Text("액션 2"),
                    onPressed: () => print("Action 2"),
                    isDefaultAction: true
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text("액션 닫기"),
                  // nullSafaty 적용 된 내용
                  // onPressed: () => Navigator.of(context)!.pop(),

                  // nullSafaty 미적용
                  onPressed: () => Navigator.of(context).pop(),
                  isDestructiveAction: true
                )
              )
            );
            
          }
        ),
      ),
      child: Center(child: Text("HOME"))
    );
  }
}
