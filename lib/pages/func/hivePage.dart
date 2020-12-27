// dev 채널로 변경한 이후 다른 패키지에서는 null-safety를 지원하지 않을 수 있으므로
// 실행시 아래 명령어를 입력하여 실행해주세요
// > flutter run --no-sound-null-safety
// > Hot reload : r || R

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hive"),),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: _db(),
            builder: (context, AsyncSnapshot<String> snap) => Text("DB_DATA : ${snap.data.toString()}"),
          ),
        ),
      ),
    );
  }

  Future<String> _db() async{
    const String _DB_NAME = "db";
    const String _DB_KEY = "dbKey";
    const String _DB_VALUE = "dbValue";
    await Hive.initFlutter();
    await Hive.openBox(_DB_NAME);
    final Box _dbBox = Hive.box(_DB_NAME);
    await _dbBox.put(_DB_KEY, _DB_VALUE);
    String _dbData = _dbBox.get(_DB_KEY)?.toString() ?? "none";
    return _dbData;
  }

}