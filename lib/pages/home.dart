import 'dart:html';

import 'package:flutter/material.dart';



class Event{
  String name = "";
  String short_description = "";
  String autor_name = "";
  String long_description = "";
  String place = "";
  String date = "";
  String time = "";
}
String e_name = "";
String s_description = "";
String l_description = "";
String e_place = "";
String e_date = "";
String e_time = "";


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "home_page";
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  List<Event> Events_list = [];
  //Event e1 = new Event();
  int Count = 0;
  int Current_index = 0;
  bool not_first = false;
  @override
  void initState(){
    super.initState();
    Event e1 = Event();
   // Events_list.addAll(['Пойти в театр', 'Погулять по набережной', 'Сходить в кино']);
  }
  
  Widget build(BuildContext context){
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 16, 79, 58),
          title: Text('Обзор', style:
          TextStyle(
            fontSize: 30,
            fontFamily: 'Oswald',
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body:
      ListView.builder(
          itemCount: Events_list.length,
          itemBuilder: (BuildContext context, int index){
            return ElevatedButton(
              style:
              ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  maximumSize: Size(370.0, 170.0),
                  padding: EdgeInsets.all(0),
                backgroundColor: Colors.white,
                  //borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.white,
                      width: 1),
                  ),
              onPressed: (){},
                key: Key(Events_list[index].name),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  constraints: BoxConstraints(
                    minHeight: 40, //minimum height
                    maxHeight: 170,
                  maxWidth: 370),
                  decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 16, 79, 58),

                  ),
                  child:
                        Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width : 20),
                                  Text(Events_list[index].date,

                                    style:
                                    TextStyle(
                                      fontSize: 21,
                                      fontFamily: 'Oswald',
                                      color: Colors.white,
                                    ),),

                                  Text(Events_list[index].time,
                                    style:
                                    TextStyle(
                                      fontSize: 21,
                                      fontFamily: 'Oswald',
                                      color: Color.fromARGB(255, 247, 183, 59),
                                    ),),
                                  SizedBox(height : 10),
                                  Row(
                                    children: [
                                      Icon(Icons.place_outlined),
                                      Text(Events_list[index].place,
                                        style:
                                        TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Oswald',
                                          color: Color.fromARGB(255, 154, 220, 184),
                                        ),),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width : 35),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('assets/wom.jpeg'),
                                        minRadius: 15.0,
                                        maxRadius: 20.0,
                                      ),
                                      SizedBox(width: 10,),
                                      Text("Олег, 28",
                                        style:
                                        TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Oswald',
                                          color: Color.fromARGB(255, 247, 183, 59),
                                        ),),
                                    ],
                                  ),
                                  Row(
                                   children: [
                                     Container(
                                       width: 208,
                                       child: Text(Events_list[index].name,
                                         softWrap: true,
                                         style:
                                         TextStyle(
                                           fontSize: 18,
                                           fontFamily: 'Oswald',
                                           color: Color.fromARGB(255, 247, 183, 59),
                                         ),),
                                     ),
                                   ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 208,
                                        child:
                                        Text(Events_list[index].short_description,
                                          softWrap: true,
                                          style:
                                          TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Oswald',
                                            color: Colors.white,
                                          ),),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ]
                        ),
                  ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 16, 79, 58),
        onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить событие',
                  style:
                  TextStyle(
                  fontSize: 30,
                  fontFamily: 'Oswald',
                  color: Colors.black,
                ),),

                actions: [
                  //Text("Введите название события"),
                  TextField(
                    // obscureText: true,
                    maxLength: 50,
                    decoration:
                    //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    InputDecoration(
                      labelText: 'Название события',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                      contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    ),
                    onChanged:  (String n_value) {
                      e_name = n_value;
                    },
                  ),



                  TextField(
                    // obscureText: true,
                    maxLength: 120,
                    maxLines: 3,
                    decoration:
                    //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    InputDecoration(
                      labelText: 'Краткое описание',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                      contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    ),
                    onChanged: (String s_des) {
                      s_description = s_des;
                    },
                  ),

                  TextField(
                    // obscureText: true,
                    maxLength: 180,
                    maxLines: 3,
                    decoration:
                    //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    InputDecoration(
                      labelText: 'Подробное описание',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                      contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    ),
                    onChanged: (String l_des) {
                      l_description = l_des;
                    },
                  ),

                  TextField(
                    // obscureText: true,
                    maxLength: 25,
                    maxLines: 1,
                    decoration:
                    //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    InputDecoration(
                      labelText: 'Место',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                      contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    ),
                    onChanged: (String place) {
                      e_place = place;
                    },
                  ),

                  TextField(
                    // obscureText: true,
                    maxLength: 8,
                    maxLines: 1,
                    decoration:
                    //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    InputDecoration(
                      labelText: 'Дата',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                      contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    ),
                    onChanged: (String date) {
                      e_date = date;
                    },
                  ),

                  TextField(
                    // obscureText: true,
                    maxLength: 5,
                    maxLines: 1,
                    decoration:
                    //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    InputDecoration(
                      labelText: 'Время',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                      contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    ),
                    onChanged: (String time) {
                      e_time = time;
                    },
                  ),



                  TextButton(
                    onPressed: () {
                      setState(() {
                        //bool fool = true;
                        if(!((e_name.length > 0)&&(s_description.length > 0)&&(l_description.length > 0)&&(e_place.length > 0)&&(e_date.length > 0)&&(e_time.length > 0))){
                          print("событие не заполнено!!");
                        }
                        else {
                          Events_list.add(Event());
                          Events_list.last.name = e_name.trim();
                          Events_list.last.short_description = s_description.trim();
                          Events_list.last.long_description = l_description.trim();
                          Events_list.last.place = e_place.trim();
                          Events_list.last.date = e_date.trim();
                          Events_list.last.time = e_time.trim();
                          not_first = true;
                          //if(not_first == true){
                            e_name = "";
                            s_description = "";
                            l_description = "";
                            e_place = "";
                            e_date = "";
                            e_time = "";
                          //}
                        }
                      });
                    },

                    child: Text('Добавить событие', style:
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
              );
            });
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Current_index,
        backgroundColor: Colors.white,
        //fixedColor: Colors.white,
        //selectedItemColor: Color(f),
        unselectedLabelStyle: TextStyle(
         fontSize: 14,
          fontFamily: 'Oswald',
         color: Colors.lightGreen,
         decorationColor: Colors.lightGreen,
         //backgroundColor: Colors.white,
       ),
       selectedLabelStyle:
        TextStyle(
         fontSize: 14,
         fontFamily: 'Oswald',
         color: Colors.lightGreen,
         decorationColor: Colors.lightGreen,
         //backgroundColor: Colors.white,
       ),
       // currentIndex:,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined, color: Color.fromARGB(255, 16, 79, 58), size: 25,),
            label: 'Обзор',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 16, 79, 58), size: 25,),
            label: 'Личный кабинет',
          ),
          //IconButton(onPressed: (){}, icon: icon)
        ],
        onTap: (index){
          setState(() {
            Current_index = index;
          });
        },
      )
    );
  }
}


