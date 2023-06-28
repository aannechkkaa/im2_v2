
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im2/pages/account.dart';
import 'package:im2/pages/Users.dart';
import 'package:im2/pages/MyWidgets/home_pics.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'Event.dart';
import 'package:im2/pages/add_event.dart';
import 'package:im2/pages/Events.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "home_page";
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  List<Event> current_events = [];
  //Event e1 = new Event();
  int Count = 0;
  int Current_index = 0;
  bool not_first = false;

  @override
  // void initState(){
  //   super.initState();
  //   Event2 e1 = Event2();
  //   // Events_list.addAll(['????? ? ?????', '???????? ?? ??????????', '??????? ? ????']);
  // }

  Widget build(BuildContext context){
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Color.fromARGB(255, 16, 79, 58),
        title: Text('События', style:
        TextStyle(
          fontSize: 30,
          fontFamily: 'Oswald',
          color: Colors.white,
        ),
        ),
        centerTitle: false,
        leading: Padding( padding: EdgeInsets.only(left: 12.0, top: 7.0, bottom: 7.0 ),
          child:
          ClipOval(
            child: Image.network(
            Users.last.avatarUrl!,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
            ),
          )

    ),

      ),
      body:
          ListView(

            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),

                  Text("Категории",
                    style:
                    TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 247, 190, 59),
                      fontFamily: 'Oswald',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.95,

                child:
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        // Handle button press
                      },
                      child: Image.asset(
                        "assets/active.jpg",
                        height: 82,
                        width: 172,
                      ),
                    ),


                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        // Handle button press
                      },
                      child: Image.asset(
                        "assets/food.jpg",
                        height: 82,
                        width: 172,
                      ),
                    ),


                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        // Handle button press
                      },
                      child: Image.asset(
                        "assets/art.jpg",
                        height: 82,
                        width: 172,
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        // Handle button press
                      },
                      child: Image.asset(
                        "assets/nature.jpg",
                        height: 82,
                        width: 172,
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        // Handle button press
                      },
                      child: Image.asset(
                        "assets/night.jpg",
                        height: 82,
                        width: 172,
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        // Handle button press
                      },
                      child: Image.asset(
                        "assets/trevel.jpg",
                        height: 82,
                        width: 172,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),



                    //Image(image: AssetImage("assets/active.jpg")),
                    // Добавьте дополнительные кнопки или виджеты по вашему усмотрению
                  ],
                ),

              ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){

              },
                  child: Text(
                    "Показать все",
                    style:
                    TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey,
                      //fontFamily: 'Oswald',
                    ),
                  )),

              // Container(
              //   width: double.infinity,
              //   margin: EdgeInsets.symmetric(horizontal: 1.0),
              //   child: Divider(
              //     color: Color.fromARGB(255, 16, 79, 58),
              //     thickness: 2.0,
              //   ),
              // ),
              SizedBox(
                height: 20,

              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Text("Ближайшие события",
                    style:
                    TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 247, 190, 59),
                      fontFamily: 'Oswald',
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: events_add_page.length * 250,
                child:
                ListView.builder(
                    itemCount: events_add_page.length,
                    itemBuilder: (BuildContext context, int index){
                      return
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child:
                        IntrinsicHeight(
                          child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 0,
                              //fixedSize: Size(MediaQuery.of(context).size.width * 0.95, 170),
                              padding: EdgeInsets.all(0),

                              backgroundColor: Colors.transparent,
                              //borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(color: Colors.transparent,
                                  width: 1),
                            ),
                            onPressed: (){
                              //Navigator.pushNamed(context, '/event');
                              //Event_page() event_page = new Event_page();
                              Event_index = index;
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => new Event_page())
                              );
                            },
                            key: Key(events_add_page[index].index.toString()),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              //height: 185,
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                              // constraints: BoxConstraints(
                              //   minHeight: 40, //minimum height
                              //   maxHeight: 185,
                              // ),
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
                                          Text(events_add_page[index].Date.day.toString() + "/" + events_add_page[index].Date.month.toString() + "/" + (events_add_page[index].Date.year.toInt() % 100).toString(),

                                            style:
                                            TextStyle(
                                              fontSize: 21,
                                              fontFamily: 'Oswald',
                                              color: Colors.white,
                                            ),),

                                          Text(events_add_page[index].Time.toString()[10] + events_add_page[index].Time.toString()[11] + events_add_page[index].Time.toString()[12] + events_add_page[index].Time.toString()[13] + events_add_page[index].Time.toString()[14] ,
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
                                                              Text(events_add_page[index].place,
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


                                    SizedBox(width : MediaQuery.of(context).size.width * 0.03,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                            // Divider(
                                            //   height: double.infinity,
                                            //   thickness: 2,
                                            //   color: Colors.grey,
                                            //   indent: 10,
                                            //   endIndent: 10,
                                            // )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    SizedBox(width : MediaQuery.of(context).size.width * 0.03,),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                events_add_page[index].event_autor.avatarUrl!,
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width : MediaQuery.of(context).size.width * 0.04,),
                                            Text(events_add_page[index].event_autor.username + "," + " " + events_add_page[index].event_autor.age.toString(),
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
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child: Text(events_add_page[index].name,
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
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child:
                                              Text(events_add_page[index].shortDescription,
                                                softWrap: true,
                                                style:
                                                TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Oswald',
                                                  color: Colors.white,
                                                ),),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            home_pics_builder(context, events_add_page[index].picURL1),
                                            SizedBox(width: 2,),
                                            home_pics_builder(context, events_add_page[index].picURL2),
                                          ],
                                        )
                                      ],
                                    )
                                  ]
                              ),
                            ),
                          ),
                        ),

                      );

                    }
                ),
              ),

              
            ],
          ),

      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 16, 79, 58),
        onPressed: () {
          Navigator.push(context, PageTransition(
              type: PageTransitionType.fade,
              // duration: Duration.millisecondsPerSecond(),
              alignment: Alignment.center,
              child: add_event()));
        },
        child: SvgPicture.asset(
          'assets/add_icon_white.svg',
          // Укажите размер изображения
          width: 30,
          height: 30,
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
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50.0)),
                                border: Border.all(
                                  color: Color.fromARGB(255, 16, 79, 58),
                                  width: 1.7,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  Users.last.avatarUrl!,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          ),
                          Text(
                            "Профиль",
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