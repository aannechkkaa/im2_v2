import 'dart:io';

import 'package:flutter/material.dart';
import 'package:im2/pages/home.dart';


class Comment{
  String autor_name = "";
  String autor_age = "";
  String comment = "";
  //String autor_photo = "";
}
class Event_members{
  String name = "Антон";
  int age = 45;
}
String u_r_member = "Хочу пойти";
String comment_txt = "";
List<Comment> Comment_list = [];
List<Event_members> Members_list = [];

class Event_page extends StatefulWidget {
  const Event_page({Key? key}) : super(key: key);

  @override
  State<Event_page> createState() => _Event_pageState();
}

class _Event_pageState extends State<Event_page> {
  // void Current_event(String name,String short_description,String autor_name, String long_description,String place,String date,String time,){
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30,
          onPressed: () => {
            Navigator.of(context).pop(),
          },
        ),
        backgroundColor: Color.fromARGB(255, 16, 79, 58),
        title: Text('Страница события', style:
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
            Container(
              //decoration: new BoxDecoration(
             //   borderRadius: new BorderRadius.circular(16.0),
              //  color: Colors.red,
              //),
            //SizedBox(height: 25),
            child:
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 5),
                  Padding(padding: EdgeInsets.all(25.0),
                    child:
                    Row(

                      mainAxisSize: MainAxisSize.max,

                      textDirection: TextDirection.ltr,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //SizedBox(width: 25,),
                        Column(
                          children: [
                            //SizedBox(width: 20,),

                            CircleAvatar(
                              backgroundImage: AssetImage('assets/wom.jpeg'),
                              minRadius: 30.0,
                              maxRadius: 30.0,
                            ),
                            SizedBox(width: 10,),
                            Text("Олег, 28",
                              style:
                              TextStyle(
                                fontSize: 22,
                                fontFamily: 'Oswald',
                                color: Color.fromARGB(255, 16, 79, 58),
                              ),),
                          ],
                        ),

                        SizedBox(width: 63,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            //mainAxisAlignment: MainAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              //SizedBox(width: 70),
                              Container(
                                //width: 270,
                                 // decoration: new BoxDecoration(
                                 //  borderRadius: new BorderRadius.circular(16.0),
                                  //  color: Colors.green,
                                 // ),
                                  padding: const EdgeInsets.only(bottom: 45),

                                  //margin: const EdgeInsets.only(top: -20),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:[


                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                //Icons.border_color_outlined
                                                  Icons.place_outlined,
                                                  color: Color.fromARGB(255, 247, 190, 59)),
                                              Text("МестоМестоМестоМесто",
                                                softWrap: true,
                                                maxLines: 2,

                                                style:
                                                TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: 'Oswald',
                                                  color: Color.fromARGB(255, 247, 190, 59),
                                                ),),

                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [

                                          Container(
                                            padding: const EdgeInsets.only(left: 25),
                                            //alignment: Alignment.bottomRight,
                                            //color: Colors.blue,
                                            child:
                                            Column(
                                              children: [
                                                Text("17:00",
                                                  softWrap: true,
                                                  maxLines: 2,

                                                  style:
                                                  TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Oswald',
                                                    color: Color.fromARGB(255, 16, 79, 58),
                                                  ),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            //color: Colors.red,
                                              child:
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.end,

                                                children: [
                                                  Text("11 Марта",
                                                    softWrap: true,
                                                    maxLines: 2,

                                                    style:
                                                    TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Oswald',
                                                      color: Color.fromARGB(255, 16, 79, 58),
                                                    ),),
                                                ],

                                              )
                                          )

                                        ],
                                      )


                                    ],
                                  )



                              )



                            ],
                          ),
                        ),


                        //SizedBox(width: 25,),

                      ],
                    ),
                    )


                ],
              ),
            ),

            Row(
              children: [
                SizedBox(width: 25,),
                Text("Хочу пойти в Мариинский театр",
                  style:
                  TextStyle(
                    fontSize: 20,
                    fontFamily: 'Oswald',
                    color: Color.fromARGB(255, 16, 79, 58),
                  ),),
              ],
            ),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 25,),
                Flexible(
                  child:Text("Хочу пойти в Мариинский театр лялялялялял ялялялялялялял ялляляляляляляля ляя ляляляля щящящящ лялялял "
                      "jxjxjxjxj xjxjxjx jxjxjxjxj"
                      ,
                    softWrap: true,
                    maxLines: 5,
                    style:
                    TextStyle(
                      fontSize: 17,
                      fontFamily: 'Oswald',
                      color: Color.fromARGB(255, 16, 79, 58),
                    ),),
                ),
                SizedBox(width: 25,),


              ]
              ),
            SizedBox(
              height: 50,
            ),
            Container(
            //  decoration: new BoxDecoration(
            //   border: Border.all(
             //    width: 1,
            //    ),
            //    color: Colors.green,
            //  ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child:
                                    IconButton(
                                      onPressed: (){
                                        showDialog(context: context, builder: (BuildContext context)
                                        {
                                          return AlertDialog(
                                            title: Text('Уже идут',
                                              style:
                                              TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Oswald',
                                                color: Colors.black,
                                              ),
                                            ),
                                            content: SizedBox(
                                              width: 100,
                                              height: Members_list.length*30,
                                              child: ListView.builder(

                                                  itemCount: Members_list.length,
                                                  itemBuilder: (BuildContext context, int index){
                                                    return Container(
                                                        child:
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(0, 0,0 , 15.0),
                                                              child: Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    backgroundImage: AssetImage('assets/wom.jpeg'),
                                                                    minRadius: 17.0,
                                                                    maxRadius: 17.0,
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Text("Олег Иванов лоии ")
                                                                ],
                                                              ),
                                                            )



                                                    );
                                                  }
                                              ),
                                            )
                                          );
                                        });
                                      },
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
                                            color: Colors.black38,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),),

                                  Padding(padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                    child:
                                    IconButton(
                                      onPressed: (){
                                          showDialog(context: context, builder: (BuildContext context)
                                          {
                                            return AlertDialog(
                                                title: Text('Уже идут',
                                                  style:
                                                  TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Oswald',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                content: SizedBox(
                                                  width: 100,
                                                  height: Members_list.length*30,
                                                  child: ListView.builder(

                                                      itemCount: Members_list.length,
                                                      itemBuilder: (BuildContext context, int index){
                                                        return Container(
                                                            child:
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(0, 0,0 , 15.0),
                                                              child: Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    backgroundImage: AssetImage('assets/wom.jpeg'),
                                                                    minRadius: 17.0,
                                                                    maxRadius: 17.0,
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Text("Олег Иванов лоии ")
                                                                ],
                                                              ),
                                                            )



                                                        );
                                                      }
                                                  ),
                                                )
                                            );
                                          });
                                      },
                                      icon:Container(
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
                                            color: Colors.black38,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),),
                                  Padding(padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                    child:
                                    IconButton(
                                      onPressed: (){
                                          showDialog(context: context, builder: (BuildContext context)
                                          {
                                            return AlertDialog(
                                                title: Text('Уже идут',
                                                  style:
                                                  TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Oswald',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                content: SizedBox(
                                                  width: 100,
                                                  height: Members_list.length*30,
                                                  child: ListView.builder(

                                                      itemCount: Members_list.length,
                                                      itemBuilder: (BuildContext context, int index){
                                                        return Container(
                                                            child:
                                                            Padding(
                                                              padding: EdgeInsets.fromLTRB(0, 0,0 , 15.0),
                                                              child: Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    backgroundImage: AssetImage('assets/wom.jpeg'),
                                                                    minRadius: 17.0,
                                                                    maxRadius: 17.0,
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Text("Олег Иванов")
                                                                ],
                                                              ),
                                                            )



                                                        );
                                                      }
                                                  ),
                                                )
                                            );
                                          });
                                      },
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
                                            color: Colors.black38,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),),
                                ],
                              ),

                            ],
                          )
                        ],
                      ),

                      SizedBox(width: 5,),
                      Column(
                        children: [
                          Text(Members_list.length.toString() + " уже идут"
                            ,
                            style:
                            TextStyle(
                              fontSize: 17,
                              //fontFamily: 'Oswald',
                              color: Color.fromARGB(255, 16, 79, 58),
                            ),)
                        ],
                      ),


                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                       // decoration: new BoxDecoration(
                         // border: Border.all(
                         //   width: 1,
                         // ),
                         // color: Colors.green,
                        //),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          textDirection: TextDirection.rtl,
                          children: [
                            //SizedBox(width: 90,),
                            TextButton(onPressed: (){
                              if(u_r_member != "Вы участник!") {
                                showDialog(context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text(
                                            'Вы уверены, что хотите присоединиться к мероприятию?',
                                            style:
                                            TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Oswald',
                                              color: Colors.black,
                                            ),
                                          ),
                                          content: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Members_list.add(
                                                          new Event_members());
                                                      u_r_member =  "Вы участник!";
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Да")
                                              ),
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text("Нужно подумать!"),
                                              ),
                                            ],
                                          )
                                      );
                                    });
                              }

                              else{

                                  showDialog(context: context, builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Вы уже присоединились к событию!',
                                          style:
                                          TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Oswald',
                                            color: Colors.black,
                                          )),
                                    );}
                                  );
                                  //sleep(Duration(seconds:3));
                                  Navigator.pop(context);



                              }

                              ;
                            },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  backgroundColor: Color.fromARGB(255, 247, 190, 59),
                                  //foregroundColor: Colors.pink,
                                ),
                                child: Text(u_r_member,
                                  style:
                                  TextStyle(
                                    fontSize: 17,
                                    //fontFamily: 'Oswald',
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      )


                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1.4)
                    )
                  ),
                  child: SizedBox(
                    width: 300,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 320,
              width: 280,
              child:
              ListView.builder(
                itemCount: Comment_list.length,
                itemBuilder: (BuildContext context, int index){
                  // return Flexible(
                  //   child:
                  //   Container(
                      //color: Colors.lightGreenAccent,
                      //child:
                  if (Comment_list.length < 1){
                    return Text(
                      "Оставьте свой комментарий!"
                    );
                  }
                  else {
                    return Container(
                      child:
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/wom.jpeg'),
                                      minRadius: 17.0,
                                      maxRadius: 17.0,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(

                                          key: Key(Comment_list[index].comment),
                                          "Олег Иванов",
                                          softWrap: true,
                                          maxLines: 6,
                                          style:
                                          TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Oswald',
                                            color: Color.fromARGB(
                                                255, 16, 79, 58),
                                          ),)
                                      ]

                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [

                                  //padding: const EdgeInsets.only(bottom: ),
                                  SizedBox(
                                    width: 42,
                                    height: 42,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //
                                  //       key: Key(Comment_list[index].comment),
                                  //       "5 МИНУТ НАЗАД",
                                  //       softWrap: true,
                                  //       maxLines: 6,
                                  //       style:
                                  //       TextStyle(
                                  //         fontSize: 12,
                                  //         fontFamily: 'Oswald',
                                  //         color: Color.fromARGB(255, 247, 190, 59),
                                  //       ),)
                                  //   ],
                                  // ),

                                  Container(
                                    width: 220,
                                    child:
                                    Row(
                                      children: [

                                        Flexible(child:

                                        Text(

                                          key: Key(Comment_list[index].comment),
                                          Comment_list[index].comment,
                                          softWrap: true,
                                          maxLines: 6,
                                          style:
                                          TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Oswald',
                                            color: Color.fromARGB(
                                                255, 16, 79, 58),
                                          ),))

                                      ],
                                    ),
                                  )

                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),


                    );
                  }


                  //   )
                  // );
                }
              ),
          ),

          ]

        ),
        bottomNavigationBar:BottomAppBar(
        shape: const CircularNotchedRectangle(),
    color: Colors.white,
    child: IconTheme(
    data: IconThemeData(color: Colors.deepOrange),
    child: Padding(padding: EdgeInsets.all(5.0),
    child:
    SizedBox(
    height: 72,

    child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //SizedBox(
       //   width: 25,
       // ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/wom.jpeg'),
                minRadius: 17.0,
                maxRadius: 17.0,
              ),
            )
          ],
        ),
        //SizedBox(width: 10,),
        Column(
          children: [
            Container(
              width: 270,
              child:
              TextField(
                // obscureText: true,
                maxLength: 160,
                maxLines: 1,
                decoration:
                //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                InputDecoration(

                  labelText: 'Введите сообщение',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.blueGrey, fontFamily: 'Oswald'),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                ),
                onChanged: (String comment) {
                  comment_txt = comment;
                },
              ),
            )

          ],
        ),

       // SizedBox(width: 3,),
        Column(
          children: [
            IconButton(onPressed: (){
              setState(() {
                Comment_list.add(Comment());
                Comment_list.last.comment = comment_txt;
                comment_txt = "";
                print(Comment_list.length);
              });},
                icon: Icon(
                  color: Color.fromARGB(255, 247, 190, 59),
                  Icons.arrow_circle_right_rounded,
                  size: 35,)
            )
            // SizedBox(
            //    width: 25,
            //    height: 25,
            //   child: FloatingActionButton(
            //     backgroundColor: Colors.orange,
            //     elevation: 1,
            //     onPressed: () => {},
            //     child:
            //     Icon( Icons.arrow_right_outlined, size: 30,),
            //   ),
            //
            // )

          ],
        )
      ],
    ),


    )
    )
    ),



    ));
  }
}
