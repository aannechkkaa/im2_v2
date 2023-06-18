
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im2/pages/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:email_validator/email_validator.dart';

class Reg_p extends StatefulWidget {
  const Reg_p({Key? key}) : super(key: key);
  static const routeName = "reg_page";
  @override
  Reg_page createState() => Reg_page();
}

class Reg_page extends State<Reg_p> {
  File? avatar;

  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {}, icon: Icon(Icons.settings), iconSize: 35,)
          ],
          leading: Padding(padding: EdgeInsets.only(
              left: 12.0, top: 7.0, bottom: 7.0),
            child:
            CircleAvatar(
              backgroundImage: AssetImage('assets/wom.jpeg'),

              radius: 10,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 16, 79, 58),
          title: Text('?????? ???????', style:
          TextStyle(
            fontSize: 30,
            fontFamily: 'Oswald',
            color: Colors.white,
          ),
          ),
          centerTitle: false,
        ),

        body:
        Column(
          children: [
            Center(
              child:
                  avatar != null
                  ? Image.file(
                    avatar!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  )
              : CircleAvatar(
                backgroundImage: AssetImage('assets/wom.jpeg'),
                minRadius: 50,
                maxRadius: 90,
              ),

            ),
            TextButton(
                onPressed: (){
                  Future pickImage() async{
                    try{
                      final avatar = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (avatar == null) return;

                      final imageTemporary = File(avatar.path);
                      setState(() => this.avatar = imageTemporary);
                    } on PlatformException catch(e){
                      print('Failed to pick nimage: $e');
                    }

                  }
                  
                },
                child: Text("Зашрузить фото")
            )
          ],
        ),





        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 16, 79, 58),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.white,
            child: IconTheme(
              data: IconThemeData(color: Colors.deepOrange),
              child: Padding(padding: EdgeInsets.all(5.0),
                  child:
                  SizedBox(
                    height: 65,
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(onPressed: (() {
                              Navigator.push(context, PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Home()));
                            }),
                                icon: Icon(Icons.map_outlined,
                                  color: Color.fromARGB(255, 16, 79, 58),
                                  size: 25,)
                            ),
                            Text(
                              '?????',
                              style:
                              TextStyle(
                                fontSize: 16,
                                fontFamily: 'Oswald',
                                color: Color.fromARGB(255, 16, 79, 58),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [

                            IconButton(onPressed: (() {
                              //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Reg_p()));
                            }),
                              icon: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  image: DecorationImage(
                                    image: AssetImage('assets/wom.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50.0)),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 247, 183, 59),
                                    width: 1.7,
                                  ),
                                ),
                              ),

                            ),
                            Text(
                              '????',
                              style:
                              TextStyle(
                                fontSize: 16,
                                fontFamily: 'Oswald',
                                color: Color.fromARGB(255, 247, 183, 59),
                              ),
                            )
                          ],
                        )
                      ],),
                  )
              ),
            )
        ),
      ),
    );
  }
//const Account({Key? key}) : super(key: key);
}