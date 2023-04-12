import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';

class Reg_p extends StatefulWidget {
  const Reg_p({Key? key}) : super(key: key);
  static const routeName = "reg_page";
  @override
  Reg_page createState() => Reg_page();
}

class Reg_page extends State<Reg_p> {

  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context ){
    bool? isCheked = false;
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
          appBar: AppBar(
            //fvbfd
            backgroundColor: Colors.white,
            title: Text('Личный кабинет', style:
            TextStyle(
              fontSize: 30,
              fontFamily: 'Oswald',
              color: Colors.black,
            ),
            ),
            centerTitle: true,
          ),

          body: SafeArea(child:
          Text('AMA BITCH AMA BOSS'),
      ),
     ),
    );
  }
//const Account({Key? key}) : super(key: key);
}