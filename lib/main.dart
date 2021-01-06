// [ SETUP ~ RUN ]
// 0. export PATH="$PATH:~/bin"
// 1. flutter channel dev
// 2. flutter upgrade
// 3. flutter config --enable-web
// (> flutter pub get)
// 4. flutter run -d chrome --no-sound-null-safety

// Flutter 1.26.0-1.0.pre
// -> APP : > flutter run --no-sound-null-safety
// -> WEB : > flutter run -d chrome --no-sound-null-safety
import 'package:all3/pages/func/hivePage.dart';
import 'package:all3/pages/func/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'dart:js';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance!.resamplingEnabled = true;

  // [index.html]- JS Window 객체에 담겨있는 Method 또는 function 을 실행
  context.callMethod('logger', ['FlutterState']);
  context.callMethod('alertMessage', ['Flutter is calling upon JavaScript!']);

  // [index.html]- JS Window 객체에 담겨있는 State 키 값을 출력
  var state = JsObject.fromBrowserObject(context['state']);
  print(state['hello']);

  // Dart 에서 JS Window 객체 생성 및 호출
  JsObject object = JsObject(context['Object']);
  object['greeting'] = 'Hello';
  object['greet'] = (name) => "${object['greeting']} $name";

  dynamic message = object.callMethod('greet', ['JavaScript']);
  context['console'].callMethod('log', [message]);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // * (1) Static Route
      // routes: {
      //   '/': (BuildContext context) => MyHomePage(title: 'Flutter Demo Home Page'),
      //   // '/a': (BuildContext context) => MyHomePage(title: '/a'),
      //   // '/a/:id': (BuildContext context) => MyHomePage(title: 'ID'),
      // },

      // * (2) Dynamic Parameter
      //Route<dynamic> Function(RouteSettings)
      initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) =>  MyHomePage(title: "/",),
      //   '/screen1': (BuildContext context) =>  MyHomePage(title: 'SCR',),
      // },

      onGenerateRoute: (settings) {
        print("CONNECT!");
        print("settings $settings");

        // * (2-1) '/'
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: RouteSettings(name: '/'),
            builder: (context) => MyHomePage(title: 'Flutter Demo Home Page'), 
            maintainState: false
          );
        }
        
        // * (2-2) '/a/:id?value=123'
        Uri uri = Uri.parse(settings.name!);
        // - StaticPath
        if (uri.pathSegments.first == 'a') {

          // - DynamicPath
          List aUriPath = uri.pathSegments.toList();
          String aUriPathData = '';

          if(aUriPath.length >= 2){
            aUriPath.forEach((e) {
              aUriPathData += "/${e.toString()}";
            });
          }
          else{
            aUriPathData = aUriPath[0].toString();
          }
          
          // - QS
          String qsValue;
          qsValue = uri.queryParameters['value']?.toString() ?? 'none';
          print(settings.name);
          return MaterialPageRoute(
            settings: RouteSettings(name: settings.name.toString()),
            builder: (context) => MyHomePage(
              title: '/a - path : $aUriPathData / qs : $qsValue'
              ),
            maintainState: false
          );
        }
        if (uri.pathSegments.first == 'b') {
          return MaterialPageRoute(
            settings: RouteSettings(name: '/b'),
            builder: (context) => new PageTwo()
          );
        }

        if(uri.pathSegments.first == 'sharedPrefPage'){
          return MaterialPageRoute(
            settings: RouteSettings(name: '/sharedPrefPage'),
            builder: (BuildContext context) => SharedPrefPage()
          );
        }

        // (3) 404
        return MaterialPageRoute(
          settings: RouteSettings(name: '/none'),
          builder: (context) => MyHomePage(title: 'NO Page'), 
          maintainState: false
        );
      },
      home: ((){
        // isWEB Check
        // * Doc : https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html
        const bool kIsWeb = identical(0, 0.0);
        if(kIsWeb) return null;
        return HivePage();
      })(),
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
  int _counter = 0;

  @override
  void initState() {
    const bool kIsWeb = identical(0, 0.0);
    if(kIsWeb){
      // [ IFrame 주의 ]
      // ui.platformViewRegistry
      // 코드줄에 오류가 나도 무시해도 됩니다
      // APP 으로 구동 할 경우 해당 내용과 함께
      // html, ui 패키지를 지원야합니다
      // production version 에서는 수정 되거나 import 방식이 변경 될 수 있습니다
      // - import 'dart:html' as html;
      // - import 'dart:ui' as ui;

      final html.IFrameElement _iframeElement = html.IFrameElement();
      _iframeElement.src = 'https://www.youtube.com/embed/IiX6Y-U6S18';
      ui.platformViewRegistry.registerViewFactory(
        'html.iframeElement',
        (int viewId) => _iframeElement,
      );
    }
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // (4) Page Move(push, pop)
    return WillPopScope(
      onWillPop: () async => await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          settings: RouteSettings(name: '/'),
          builder: (context) => MyHomePage(title: "RE: HI?",)
        ),
        (Route r) => false
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          actions: [
            IconButton(
              icon:Icon(Icons.group),
              // (4) Navigator 1.0 push
              // onPressed: () => Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => PageTwo())
              // ),
              // (4) Page Move(push, pop)
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  settings: RouteSettings(name: '/b'),
                  builder: (context) => PageTwo()
                )
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                identical(0, 0.0)
                ? Container(
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  margin: EdgeInsets.all(20),
                  child: HtmlElementView(
                    viewType: 'html.iframeElement',
                  ),
                )
                : Container(),
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: RouteSettings(name: '/sharedPrefPage'),
                      builder: (BuildContext context) => SharedPrefPage()
                    )
                  ), 
                  child: Text("SharedPref")
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // (4) Page Move(push, pop)
    return WillPopScope(
      onWillPop: () async => await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          settings: RouteSettings(name: '/'),
          builder: (context) => MyHomePage(title: "RE: HI?",)
        ),
        (Route r) => false
      ),
      child: Scaffold(appBar: AppBar(title: Text("PageTwo"),)),
    );
  }
}