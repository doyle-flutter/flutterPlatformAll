import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatefulWidget {
  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {

  String? value;

  @override
  void didChangeDependencies() {
    Future.microtask(() async{
      await SharedPreferences.getInstance()
        .then((SharedPreferences pref) async{
          bool check = await pref.setString("data", "VALUE");
          if(!check){
            this.value = "DB ERROR";
            return null;
          }
          // (1) TEST .catchError()
          // throw 'err';
          
          // (2) TEST .timeout()
          // return Future.delayed(Duration(seconds: 20), () async{
          //   return pref;
          // });

          // (3) TEST
          return pref;
        })
        .then((SharedPreferences? pref) => this.value = pref!.getString("data"))
        .catchError((Object o){
          this.value = "DB ERROR - Catch";
          return 'err';
        }, test: (Object o) => true)
        .timeout(Duration(seconds: 10), onTimeout: () async =>  this.value = "DB ERROR - TimeOUT");
      if(!mounted) return null;
      setState(() {});
      return;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SharedPref'),),
      body: Container(
        child: Center(
          child: Text(this.value ?? "Load..."),
        ),
      ),
    );
  }
}