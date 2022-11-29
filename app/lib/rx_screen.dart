import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Stream.fromFuture(getAge()).map((event) {
      return event * 2;
    }).listen((data) {
      print(data);
    });
    var map = HashMap<int, int>();
    map[1] = 3;
    var reuslt = <int>[];
    var a = 34555;
    print(a.toString().split('').reversed.join(''));
  

    return Scaffold();
  }

  Future<int> getAge() async {
    return 100;
  }
}
