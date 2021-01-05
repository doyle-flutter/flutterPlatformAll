import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// // main.dart 파일에 작성해주세요
// void main() => runApp(CupertinoApp(home: Page1(),));

// // [Null-Safety 미적용]
class Page1 extends StatefulWidget{
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    if(!mounted) return null;
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:(context) => Page2()
        )
      )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(middle: Text("AppleDesign 1")),
    child: Center(
      child: CupertinoActivityIndicator()
    )
  );
}

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("AppleDesign 2")),
      child: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: CupertinoButton(
                            color: Colors.red,
                            child: Text("DatePicker"),
                            onPressed: () async{
                              DateTime result = await showCupertinoModalPopup<DateTime>(
                                  context: context,
                                  builder: (context){
                                    DateTime choice;
                                    return Container(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 200.0,
                                                  color: Colors.red,
                                                  child: CupertinoDatePicker(
                                                      onDateTimeChanged: (DateTime dt){
                                                        choice = dt;
                                                      }
                                                  )
                                              ),
                                              CupertinoButton(
                                                  child: Text("select"),
                                                  onPressed: (){
                                                    if(choice == null){
                                                      choice = DateTime.now();
                                                    }
                                                    Navigator.of(context).pop(choice);
                                                  }
                                              )
                                            ]
                                        )
                                    );
                                  }
                              );
                              print(result ?? "선택하지 않았습니다");
                            }
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: CupertinoButton(
                            color: Colors.purple,
                            child: Text("TimePicker"),
                            onPressed: () async{
                              Duration result = await showCupertinoModalPopup<Duration>(
                                  context: context,
                                  builder: (context){
                                    Duration choice;
                                    return Container(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 200.0,
                                                  color: Colors.red,
                                                  child: CupertinoTimerPicker(
                                                      onTimerDurationChanged: (Duration time){
                                                        choice = time;
                                                      }
                                                  )
                                              ),
                                              CupertinoButton(
                                                  child: Text("select"),
                                                  onPressed: (){
                                                    if(choice == null){
                                                      choice = Duration();
                                                    }
                                                    Navigator.of(context).pop(choice);
                                                  }
                                              )
                                            ]
                                        )
                                    );
                                  }
                              );
                              print(result ?? "선택하지 않았습니다");
                            }
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: CupertinoButton(
                            color: Colors.brown,
                            child: Text("CustomPicker"),
                            onPressed: () async{
                              int result = await showCupertinoModalPopup<int>(
                                  context: context,
                                  builder: (context){
                                    int choice;
                                    return Container(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 200.0,
                                                  color: Colors.red,
                                                  child: CupertinoPicker(
                                                      itemExtent: 100.0,

                                                      children: [
                                                        Container(child: Center(child: Text("1번 항목"))),
                                                        Container(child: Center(child: Text("2번 항목"))),
                                                        Container(child: Center(child: Text("3번 항목"))),

                                                      ],
                                                      onSelectedItemChanged: (int i){
                                                        choice = i+1;
                                                      }
                                                  )
                                              ),
                                              CupertinoButton(
                                                  child: Text("select"),
                                                  onPressed: (){
                                                    if(choice == null){
                                                      choice = 1;
                                                    }
                                                    Navigator.of(context).pop(choice);
                                                  }
                                              )
                                            ]
                                        )
                                    );
                                  }
                              );
                              print(result ?? "선택하지 않았습니다");
                            }
                        ),
                      ),
                    ]
                ),
              )
          )
      )
  );
}



// // [Null-Safety 적용]

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// // // main.dart 파일에 작성해주세요
// // void main() => runApp(CupertinoApp(home: Page1(),));

// class Page1 extends StatefulWidget{
//   @override
//   _Page1State createState() => _Page1State();
// }

// class _Page1State extends State<Page1> {
//   @override
//   void initState() {
//     if(!mounted) return null;
//     Timer(
//       Duration(seconds: 3),
//       () => Navigator.of(context)!.pushReplacement(
//         MaterialPageRoute(
//           builder:(context) => Page2()
//         )
//       )
//     );
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) => CupertinoPageScaffold(
//     navigationBar: CupertinoNavigationBar(middle: Text("AppleDesign 1")),
//     child: Center(
//       child: CupertinoActivityIndicator()
//     )
//   );
// }

// class Page2 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context)
//   => CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(middle: Text("AppleDesign 2")),
//       child: SafeArea(
//           child: SingleChildScrollView(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.blue,
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(10.0),
//                         child: CupertinoButton(
//                             color: Colors.red,
//                             child: Text("DatePicker"),
//                             onPressed: () async{
//                               DateTime? result = await showCupertinoModalPopup<DateTime>(
//                                   context: context,
//                                   builder: (context){
//                                     DateTime? choice;
//                                     return Container(
//                                         child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                   height: 200.0,
//                                                   color: Colors.red,
//                                                   child: CupertinoDatePicker(
//                                                       onDateTimeChanged: (DateTime dt){
//                                                         choice = dt;
//                                                       }
//                                                   )
//                                               ),
//                                               CupertinoButton(
//                                                   child: Text("select"),
//                                                   onPressed: (){
//                                                     if(choice == null){
//                                                       choice = DateTime.now();
//                                                     }
//                                                     Navigator.of(context)!.pop(choice);
//                                                   }
//                                               )
//                                             ]
//                                         )
//                                     );
//                                   }
//                               );
//                               print(result ?? "선택하지 않았습니다");
//                             }
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.all(10.0),
//                         child: CupertinoButton(
//                             color: Colors.purple,
//                             child: Text("TimePicker"),
//                             onPressed: () async{
//                               Duration? result = await showCupertinoModalPopup<Duration>(
//                                   context: context,
//                                   builder: (context){
//                                     Duration? choice;
//                                     return Container(
//                                         child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                   height: 200.0,
//                                                   color: Colors.red,
//                                                   child: CupertinoTimerPicker(
//                                                       onTimerDurationChanged: (Duration time){
//                                                         choice = time;
//                                                       }
//                                                   )
//                                               ),
//                                               CupertinoButton(
//                                                   child: Text("select"),
//                                                   onPressed: (){
//                                                     if(choice == null){
//                                                       choice = Duration();
//                                                     }
//                                                     Navigator.of(context)!.pop(choice);
//                                                   }
//                                               )
//                                             ]
//                                         )
//                                     );
//                                   }
//                               );
//                               print(result ?? "선택하지 않았습니다");
//                             }
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.all(10.0),
//                         child: CupertinoButton(
//                             color: Colors.brown,
//                             child: Text("CustomPicker"),
//                             onPressed: () async{
//                               int? result = await showCupertinoModalPopup<int>(
//                                   context: context,
//                                   builder: (context){
//                                     int? choice;
//                                     return Container(
//                                         child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                   height: 200.0,
//                                                   color: Colors.red,
//                                                   child: CupertinoPicker(
//                                                       itemExtent: 100.0,

//                                                       children: [
//                                                         Container(child: Center(child: Text("1번 항목"))),
//                                                         Container(child: Center(child: Text("2번 항목"))),
//                                                         Container(child: Center(child: Text("3번 항목"))),

//                                                       ],
//                                                       onSelectedItemChanged: (int i){
//                                                         choice = i+1;
//                                                       }
//                                                   )
//                                               ),
//                                               CupertinoButton(
//                                                   child: Text("select"),
//                                                   onPressed: (){
//                                                     if(choice == null){
//                                                       choice = 1;
//                                                     }
//                                                     Navigator.of(context)!.pop(choice);
//                                                   }
//                                               )
//                                             ]
//                                         )
//                                     );
//                                   }
//                               );
//                               print(result ?? "선택하지 않았습니다");
//                             }
//                         ),
//                       ),
//                     ]
//                 ),
//               )
//           )
//       )
//   );
// }