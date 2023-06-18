
import 'package:flutter/material.dart';
import 'package:im2/pages/account.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'Event.dart';



class Event{
  String name = "";
  String short_description = "";
  String autor_name = "";
  String long_description = "";
  String place = "";
  DateTime _eventdatetime = DateTime.now();
  TimeOfDay _eventTime = TimeOfDay.now();
  int id = 0;
}

DateTime now = DateTime.now();
DateTime e_Datetime = DateTime.now();
TimeOfDay e_dateTime = TimeOfDay.now();
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
    // Events_list.addAll(['????? ? ?????', '???????? ?? ??????????', '??????? ? ????']);
  }

  Widget build(BuildContext context){
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Color.fromARGB(255, 16, 79, 58),
        title: Text('?????', style:
        TextStyle(
          fontSize: 30,
          fontFamily: 'Oswald',
          color: Colors.white,
        ),
        ),
        centerTitle: false,
        leading: Padding( padding: EdgeInsets.only(left: 12.0, top: 7.0, bottom: 7.0 ),
          child:
          CircleAvatar(
            backgroundImage: AssetImage('assets/wom.jpeg'),

            radius: 10,
          ),
        ),

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
              onPressed: (){
                //Navigator.pushNamed(context, '/event');
                //Event_page() event_page = new Event_page();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new Event_page(key: Key(Events_list[index].name),))
                );
              },
              key: Key(Events_list[index].name),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 15, left: 15),
                constraints: BoxConstraints(
                    minHeight: 40, //minimum height
                    maxHeight: 185,
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
                      SizedBox(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width : 20),
                            Text("FGB",

                              style:
                              TextStyle(
                                fontSize: 21,
                                fontFamily: 'Oswald',
                                color: Colors.white,
                              ),),

                            Text("SDFVB",
                              style:
                              TextStyle(
                                fontSize: 21,
                                fontFamily: 'Oswald',
                                color: Color.fromARGB(255, 247, 183, 59),
                              ),),

                            SizedBox(height : 10),
                            Row(

                              children: [


                                SizedBox(
                                  width: 70,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Icon(Icons.place_outlined),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 40,
                                                child:
                                                Flexible(child:
                                                Text(Events_list[index].place,
                                                  softWrap: true,
                                                  maxLines: 2,

                                                  style:
                                                  TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Oswald',
                                                    color: Color.fromARGB(255, 154, 220, 184),
                                                  ),),),
                                              )


                                            ],
                                          )
                                        ],
                                      )

                                      //Icon(Icons.place_outlined),

                                      // Flexible
                                      //   (child: new Text(Events_list[index].place,
                                      //   style: TextStyle(
                                      //     fontSize: 15,
                                      //     fontFamily: 'Oswald',
                                      //     color: Color.fromARGB(255, 154, 220, 184),),
                                      //   overflow: TextOverflow.clip,),),





                                    ],
                                  ),
                                )



                              ],
                            )
                          ],
                        ),
                      ),


                      SizedBox(width : 21),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image(image: AssetImage('assets/Vector_1.png')),
                            ],
                          )
                        ],
                      ),

                      SizedBox(width : 21),
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
                              Text("????, 28",
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
                                width: 240,
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
                                width: 240,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 16, 79, 58),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('???????? ???????',
                style:
                TextStyle(
                  fontSize: 30,
                  fontFamily: 'Oswald',
                  color: Colors.black,
                ),),

              actions: [
                //Text("??????? ???????? ???????"),
                TextField(
                  // obscureText: true,
                  maxLength: 35,

                  decoration:
                  //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                  InputDecoration(
                    labelText: '???????? ???????',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  ),
                  onChanged:  (String n_value) {
                    e_name = n_value;
                  },
                ),



                TextField(
                  // obscureText: true,
                  maxLength: 85,
                  maxLines: 3,
                  decoration:
                  //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                  InputDecoration(
                    labelText: '??????? ????????',
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
                    labelText: '????????? ????????',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  ),
                  onChanged: (String l_des) {
                    l_description = l_des;
                  },
                ),

                TextField(
                  // obscureText: true,
                  maxLength: 20,
                  maxLines: 1,
                  decoration:
                  //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                  InputDecoration(
                    labelText: '?????',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  ),
                  onChanged: (String place) {
                    e_place = place;
                  },
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 7,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(onPressed:
                            (){
                          showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024)).then((value) {
                            setState(() {
                              e_Datetime = value!;
                            });
                          });
                        },



                          child: Text('??????? ????' + "     ", style:

                          TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontFamily: 'Oswald',
                          ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.white,),
                            //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-5,10))
                          ),),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(width: 25,)
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          e_Datetime.day.toString() + "/" + e_Datetime.month.toString() + "/" + e_Datetime.year.toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Oswald'),
                        ),
                      ],
                    )
                  ],
                ),


                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 7,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(onPressed:
                            (){
                          showTimePicker(context: context,
                              initialTime: TimeOfDay.now());

                        },



                          child: Text('??????? ?????' + "     ", style:

                          TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontFamily: 'Oswald',
                          ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.white,),
                            //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-5,10))
                          ),),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(width: 25,)
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          e_dateTime.hour.toString() + ":" + e_dateTime.minute.toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Oswald'),
                        ),
                      ],
                    )
                  ],
                ),



                TextField(
                  // obscureText: true,
                  maxLength: 8,
                  maxLines: 1,
                  decoration:
                  //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                  InputDecoration(
                    labelText: '???? ? ?????',
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
                    labelText: '?????',
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
                        print("??????? ?? ?????????!!");
                      }
                      else {
                        Events_list.add(Event());
                        Events_list.last.name = e_name.trim();
                        Events_list.last.short_description = s_description.trim();
                        Events_list.last.long_description = l_description.trim();
                        Events_list.last.place = e_place.trim();
                        // Events_list.last.date = e_date.trim();
                        // Events_list.last.time = e_time.trim();

                        //Events_list.last.id = index;
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

                  child: Text('???????? ???????', style:
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
      bottomNavigationBar:BottomAppBar(
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
                          IconButton(onPressed: ((){
                            //Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Home()));
                          }),
                              icon: Icon(Icons.map_outlined,  color: Color.fromARGB(255, 247, 183, 59),)
                          ),
                          Text(
                            '?????',
                            style:
                            TextStyle(
                              fontSize: 16,
                              fontFamily: 'Oswald',
                              color: Color.fromARGB(255, 247, 183, 59),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [

                          IconButton(onPressed: ((){
                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Reg_p()));
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
                                borderRadius: BorderRadius.all( Radius.circular(50.0)),
                                border: Border.all(
                                  color: Color.fromARGB(255, 16, 79, 58),
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
                              color:  Color.fromARGB(255, 16, 79, 58),
                            ),
                          )
                        ],
                      )
                    ],),
                )
            ),
          )
      ),




      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: Current_index,
      //   backgroundColor: Colors.white,
      //   //fixedColor: Colors.white,
      //   //selectedItemColor: Color(f),
      //   unselectedLabelStyle: TextStyle(
      //     fontSize: 14,
      //     fontFamily: 'Oswald',
      //     color: Colors.lightGreen,
      //     decorationColor: Colors.lightGreen,
      //     //backgroundColor: Colors.white,
      //   ),
      //   selectedLabelStyle:
      //   TextStyle(
      //     fontSize: 14,
      //     fontFamily: 'Oswald',
      //     color: Colors.lightGreen,
      //     decorationColor: Colors.lightGreen,
      //     //backgroundColor: Colors.white,
      //   ),
      //   // currentIndex:,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.map_outlined, color: Color.fromARGB(255, 16, 79, 58), size: 25,),
      //       label: '?????',
      //
      //     ),
      //     //BottomNavigationBarItem(icon: Icon(Icons.plus_one_rounded, color: Color.fromARGB(255, 16, 79, 58), size: 25,),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 16, 79, 58), size: 25,),
      //       label: '?????? ???????',
      //     ),
      //     //IconButton(onPressed: (){}, icon: icon)
      //   ],
      //   onTap: (index){
      //     setState(() {
      //       Current_index = index;
      //     });
      //   },
      // )
    );
  }
}