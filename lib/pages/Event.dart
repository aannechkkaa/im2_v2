import 'package:flutter/material.dart';
import 'package:im2/pages/home.dart';
import 'package:comment_box/comment/comment.dart';

class Comment{
  String autor_name = "";
  String autor_age = "";
  String comment = "";
  //String autor_photo = "";
}

String comment_txt = "";
List<Comment> Comment_list = [];

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
            SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(height: 25,),

                  Row(

                    children: [
                      SizedBox(width: 25,),
                      Column(
                        children: [
                          SizedBox(width: 20,),

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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          //SizedBox(width: 70),
                          Container(
                              width: 270,
                              padding: const EdgeInsets.only(bottom: 45, left: 60),

                              //margin: const EdgeInsets.only(top: -20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[

                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       padding: const EdgeInsets.only(left: 10),
                                  //       child:
                                  //       Text("Oh-la-la"),
                                  //     )
                                  //
                                  //   ],
                                  // ),
                                  Row(
                                    children: [
                                      Row(
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
                      )

                    ],
                  ),
                ],
              ),
            SizedBox(
              height: 20,
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


              ]
              ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(width: 25,),
                Column(
                  children: [
                    Text("5 уже идут"
                      ,
                      style:
                      TextStyle(
                        fontSize: 17,
                        //fontFamily: 'Oswald',
                        color: Color.fromARGB(255, 16, 79, 58),
                      ),)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 130,),
                        TextButton(onPressed: (){},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              backgroundColor: Color.fromARGB(255, 247, 190, 59),
                              //foregroundColor: Colors.pink,
                            ),
                            child: Text("Хочу пойти",
                              style:
                              TextStyle(
                                fontSize: 17,
                                //fontFamily: 'Oswald',
                                color: Color.fromARGB(255, 16, 79, 58),
                              ),
                            ))
                      ],
                    ),

                  ],
                ),
              ],
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
                                            backgroundImage: AssetImage('assets/wom.jpeg'),
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
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  color: Color.fromARGB(255, 16, 79, 58),
                                                ),)]

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
                                                  color: Color.fromARGB(255, 16, 79, 58),
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


                  //   )
                  // );
                }
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
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
                SizedBox(width: 10,),
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

                SizedBox(width: 3,),
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
            )
          ]

        )



    );
  }
}
