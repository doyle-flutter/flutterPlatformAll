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
      if(!mounted) return null;
      await SharedPreferences.getInstance()
        .then((SharedPreferences pref) async{
          bool check = await pref.setString("data", "VALUE");
          if(!check){
            this.value = "DB ERROR";
            return null;
          }
          return pref;
        })
        .then((SharedPreferences? pref) => this.value = pref!.getString("data"));
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