// Flutter 1.26.0-1.0.pre
// -> APP : > flutter run --no-sound-null-safety
// -> WEB : > flutter run -d chrome --no-sound-null-safety
import 'package:all3/pages/func/hivePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance!.resamplingEnabled = true;
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
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