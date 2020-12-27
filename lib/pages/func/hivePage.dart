import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hive"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [ 
                {'title':123} 
              ].map( 
                (Map<String, dynamic> e) => _contents(key: e['title'].toString())
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contents({required String key, String? des}) => Row(
    children: [
      Expanded(child: Text(key)),
      Expanded(child: Text(des ?? 'none')),
    ],
  );

  Future<List> _db() async => [await Hive.openBox<String>("title")];

}