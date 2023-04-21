import 'dart:js';

import 'package:flutter/material.dart';
import 'package:im2/pages/home.dart';
import 'package:im2/pages/first_page.dart';
import 'package:im2/pages/Event.dart';
import 'package:im2/pages/account.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Event_page(),
        '/home': (context) => const Home(),
        '/event': (context) => const Event_page(),
      },
      theme: ThemeData(
      primaryColor: Colors.cyan
  ),
));