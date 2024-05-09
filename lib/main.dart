import 'package:flutter/material.dart';
import 'package:im2/pages/hello_page.dart';
import 'package:im2/pages/home.dart';
import 'package:im2/pages/first_page.dart';
import 'package:im2/pages/Event.dart';
import 'package:im2/pages/account.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:im2/pages/Users.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core_web/firebase_core_web.dart';


List<User> users = [];


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => User(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const hello_page(),
          '/home': (context) => const Home(),
          '/event': (context) => const Event_page(),
        },
        theme: ThemeData(
            primaryColor: Colors.cyan
        ),
      ),
    ),
  );
}