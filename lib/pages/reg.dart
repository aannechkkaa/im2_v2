import 'package:flutter/material.dart';
import 'home.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
      home: Home_route(),
      routes: {Home.routeName: (_)=> Home()},
    );
  }
//const Account({Key? key}) : super(key: key);
}

class Home_route extends StatefulWidget{
  @override
  Home_route_state createState() => Home_route_state();
}

class Home_route_state extends State<Home_route>{
  @override
  bool? isCheked = false;
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color.fromARGB(255, 16, 79, 58),
            iconSize: 30,
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
          backgroundColor: Colors.white,
          title: Text('Регистрация', style:
          TextStyle(
            fontSize: 30,
            fontFamily: 'Oswald',
            color: Colors.black,
          ),
          ),
          centerTitle: true,
        ),

        body: SafeArea(child:
        Column(
          children: [
            SizedBox(height: 120,),
            Card(
              child: TextField(
                obscureText: true,
                decoration:
                //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                InputDecoration(
                  labelText: 'Имя пользователя',
                  labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                ),
                Text('Пол', style:
                TextStyle(
                  fontSize: 15,
                  fontFamily: 'Oswald',
                )),
                SizedBox(width: 30,),
                Checkbox(
                    value: isCheked,
                    tristate: true,
                    activeColor: Colors.green,
                    onChanged: (now_checked){
                      setState((){
                        isCheked = true;
                      });
                    }),
                SizedBox(width: 5,),
                Text('Мужской', style:
                TextStyle(
                  fontSize: 15,
                  fontFamily: 'Oswald',
                )
                ),
                SizedBox(width: 20,),
                Checkbox(
                    value: isCheked,
                    tristate: true,
                    activeColor: Colors.green,
                    onChanged: (now_checked){
                      setState((){
                        isCheked = true;
                      });
                    }),
                SizedBox(width: 5,),
                Text('Женский', style:
                TextStyle(
                  fontSize: 15,
                  fontFamily: 'Oswald',
                )
                ),
              ],
            ),

            SizedBox(height: 10,),
            Card(
              child: TextField(
                //controller: date,
                decoration:
                //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                const InputDecoration(
                  labelText: 'Дата рождения',
                  labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                onTap: () async{
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2005));
                },
              ),
            ),

            SizedBox(height: 10,),

            Card(
              child: TextField(
                // obscureText: true,
                decoration:
                //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                InputDecoration(
                  labelText: 'Почта',
                  labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Card(
              child: TextField(
                obscureText: true,
                decoration:
                //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                InputDecoration(
                  labelText: 'Пароль',
                  labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Card(
              child: TextField(
                obscureText: true,
                decoration:
                //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                InputDecoration(
                  labelText: 'Подтверждение пароля',
                  labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                ),
              ),
            ),

            SizedBox(height: 80,),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Home.routeName);
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
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 16, 79, 58),),
                  minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-20,40))
              ),
            )
          ],
        ),
        )
    );
  }
}

