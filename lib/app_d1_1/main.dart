import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_instagram_like/screen/release_screen.dart';
import '/screen/home_screen.dart';
import '/screen/base.dart';

import '/screen/profile_screen.dart';
import '/screen/explore_screen.dart';


void main() {
  runApp(MyApp());
}


List _widgetOptions = [
  HomeUI(), //Text('Index 0: Home'),
  ExploreScreen(), // Center(child: Text('Index 1: Search')),
  Center(child: Text('Index 2: Add')),
  ReleaseScreen(),
  ProfileScreen(),
];



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram UI',
      theme: ThemeData(                              
        primarySwatch: Colors.blue,
      ),
      home: BaseUI(widgetOptions: _widgetOptions,)
    );
  }
}

