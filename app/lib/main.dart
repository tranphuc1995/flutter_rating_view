import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:rating_view/rx_screen.dart';
import 'package:rating_view/second_screen.dart';
import 'package:rating_view_widget/rating_view_widget.dart';
import 'package:get/get.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RxScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('xxxx'),
        ),
        body: FocusDetector(
            onFocusLost: () {
              log('onFocusLost');
            },
            onFocusGained: () {
              log('onFocusGained');
            },
            onVisibilityLost: () {
              log('onVisibilityLost');
            },
            onVisibilityGained: () {
              log('onVisibilityGained');
            },
            onForegroundLost: () {
              log('onForegroundLost');
            },
            onForegroundGained: () {
              log('onForegroundGained');
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'asdasdsad1',
                    style: TextStyle(fontSize: 30),
                  ),
                  FocusDetector(
                    onVisibilityGained: () {
                      log('text onVisibilityGained');
                    },
                    onVisibilityLost: () {
                      log('text onVisibilityLost');
                    },
                    child: Text(
                      'asdasdsad50',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(
                    'asdasdsad2',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa3',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa4',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad1',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad2',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa3',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa4',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad1',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad2',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa3',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa4',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad1',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad2',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa3',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa4',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad2',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa3',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa4',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad1',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsad2',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa3',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'asdasdsa4',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            )));
  }
}
