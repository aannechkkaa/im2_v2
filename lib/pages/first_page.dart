
import 'dart:io';
import 'package:im2/pages/add_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im2/pages/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:im2/pages/reg.dart';
class First_p extends StatefulWidget {
  const First_p({Key? key}) : super(key: key);

  @override
  First_page createState() => First_page();
}

class First_page extends State<First_p> {
  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Reg_route(),
      routes: {Reg_p.routeName: (_)=> Reg_p()},
    );
  }
//const Account({Key? key}) : super(key: key);
}

class Reg_route extends StatefulWidget{
  @override
  Reg_route_state createState() => Reg_route_state();
}
class Reg_route_state extends State<Reg_route>{
  @override
  bool? isCheked = false;


  File? avatar;
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



  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Вход', style:
        TextStyle(
          fontSize: 30,
          fontFamily: 'Oswald',
          color: Colors.black,
        ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 30,),
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
          //     ),
          //       Icon(Icons.account_circle_outlined, size: 25,),
          //     SizedBox(width: 5,),
          //     Text('Логин', style:
          //     TextStyle(
          //       fontSize: 20,
          //       fontFamily: 'Oswald',
          //     ),),
          //   ],
          // ),
          Card(
            child: TextField(
              decoration:
              //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
              InputDecoration(
                icon:  Icon(Icons.account_circle_outlined, size: 25,),
                labelText: 'Логин',
                labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey, fontFamily: 'Oswald'),
                contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              ),
            ),
          ),

          SizedBox(height: 30,),

          Card(
            child: TextField(
              obscureText: true,
              decoration:
              //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
              InputDecoration(
                icon: Icon(Icons.lock_outline, size: 25,),
                labelText: 'Пароль',
                labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey, fontFamily: 'Oswald'),
                contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              ),
            ),
          ),

          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
          //     ),
          //     Icon(Icons.lock_outline, size: 25,),
          //     SizedBox(width: 5,),
          //     Text('Пароль', style:
          //     TextStyle(
          //       fontSize: 20,
          //       fontFamily: 'Oswald',
          //     ),),
          //   ],
          // ),




          SizedBox(height: 20,),
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(11.0, 0.0, 0.0, 0.0),
                ),
                Checkbox(
                    value: isCheked,
                    tristate: true,
                    activeColor: Colors.green,
                    onChanged: (now_checked){
                      setState((){
                        isCheked = true;
                      });
                    }),
                Text('Запомнить меня', style:
                TextStyle(
                  fontSize: 15,
                  fontFamily: 'Oswald',
                )
                ),
              ]
          ),
          SizedBox(height: 50,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
              ),
              TextButton(onPressed: () {}, child: Text('Войти', style:
              TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Oswald',
              ),
              ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 16, 79, 58),),
                    minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-20,40))
                ),
              )
            ],
          ),



          SizedBox(height: 30,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 0.0),
              ),
              TextButton(onPressed: () {
                Navigator.of(context).pushNamed(Reg_p.routeName);
              },
                child: Text('Зарегестрироваться', style:
              TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Oswald',
              ),
              ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 154, 220, 184),),
                    minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-20,40))
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
