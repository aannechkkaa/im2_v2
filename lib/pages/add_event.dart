import 'dart:convert';
import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:im2/pages/Event.dart';
import 'package:im2/pages/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im2/pages/home.dart';
import 'package:im2/pages/Events.dart';
import 'package:im2/pages/Users.dart';
import 'package:im2/pages/MyWidgets/add_e_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:email_validator/email_validator.dart';

import 'dart:html' as html;
void sortByNearestDate(List<Event> events) {
  for (int i = 0; i < events.length - 1; i++) {
    for (int j = i + 1; j < events.length; j++) {
      DateTime date1 = DateTime(events[i].Date.year, events[i].Date.month, events[i].Date.day);
      DateTime date2 = DateTime(events[j].Date.year, events[j].Date.month, events[j].Date.day);

      if (date2.isBefore(date1)) {
        Event temp = events[i];
        events[i] = events[j];
        events[j] = temp;
      }
    }
  }
}




List<Event> events_add_page = [];
List<Event> filtred_events= [];
List<Event> current_events = [];

int Event_index = 0;
DateTime now = DateTime.now();
DateTime e_Datetime = DateTime.now();
TimeOfDay e_dateTime = TimeOfDay.now();
String e_name = "";
String s_description = "";
String l_description = "";
String e_place = "";
String e_date = "";
String e_time = "";
String _selectedCategory = "";
String create_bot_link = 'https://t.me/+8kNY4dkI1FA4YmEy';
int image_count = 0;
String event_chat_url = "";
String event_type = "Категория мероприятия";
bool type_is_chosen = false;
// class PhotoItem {
//   final String imagePath;
//
//   const PhotoItem({
//     required this.imagePath,
//   });
// }
// final List<PhotoItem> event_pics = [
// ];
// _launchURL(String url) async {
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
class add_event extends StatefulWidget {
  const add_event({super.key});
  @override
  State<add_event> createState() => _add_eventState();
}
class _add_eventState extends State<add_event> {
  String? pic1Url;
  String? pic2Url;
  Future pickImage() async {
    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();
    await input.onChange.first;
    final file = input.files!.first;
    final reader = html.FileReader();
    reader.readAsDataUrl(file);
    await reader.onLoad.first;
    final encodedImage = reader.result as String;
    final bytes = base64.decode(encodedImage.split(',').last);
    final blob = html.Blob([bytes], 'image/jpeg');
    final url = html.Url.createObjectUrl(blob);
    if(pic1Url == null){
      setState(() => this.pic1Url = url);
    }
    else{
      setState(() => this.pic2Url = url);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          //dialogTheme: Colors.green,
        ),
        //color: Colors.white,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 16, 79, 58),
            title: Text("Добавление события", style:
            TextStyle(
              fontSize: 30,
              fontFamily: 'Oswald',
              color: Colors.white,
            ),
            ),
            centerTitle: false,
          ),
          body:
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child:
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          //width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 247, 190, 59),
                            borderRadius: BorderRadius.circular(5),
                            //color: Colors.white,
                          ),
                          child:
                          DropdownButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 26,
                            iconEnabledColor: Colors.white,
                            underline: SizedBox(),
                            dropdownColor: Color.fromARGB(255, 247, 190, 59),
                            //value: 'Категория мероприятия',
                            hint: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(event_type,
                                style:
                                TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontFamily: 'Oswald',
                                ),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                child:
                                Text("Активный отдых",
                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Oswald',
                                  ),),
                                value: "Активный отдых",
                              ),
                              DropdownMenuItem(
                                child:
                                Text("Кафе и рестораны",
                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Oswald',
                                  ),),
                                value: "Кафе и рестораны",
                              ),
                              DropdownMenuItem(
                                child:
                                Text("Искусство и культура",
                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Oswald',
                                  ),),
                                value: "Искусство и культура",
                              ),
                              DropdownMenuItem(
                                child:
                                Text("Отдых на природе",
                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Oswald',
                                  ),),
                                value: "Отдых на природе",
                              ),
                              DropdownMenuItem(
                                child:
                                Text("Путешествия",
                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Oswald',
                                  ),),
                                value: "Путешествия",
                              ),
                              DropdownMenuItem(
                                child:
                                Text("Ночная жизнь",
                                  style:
                                  TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'Oswald',
                                  ),),
                                value: "Ночная жизнь",
                              )
                            ],
                            onChanged: (value){
                              setState(() {
                                event_type = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      // obscureText: true,
                      maxLength: 35,
                      decoration:
                      //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                      InputDecoration(
                        labelText: 'Название мероприятия',
                        labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      ),
                      onChanged:  (String n_value) {
                        e_name = n_value.trim();
                      },
                    ),
                    TextField(
                      // obscureText: true,
                      maxLength: 85,
                      maxLines: 3,
                      decoration:
                      //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                      InputDecoration(
                        labelText: 'Краткое описание',
                        labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      ),
                      onChanged: (String s_des) {
                        s_description = s_des.trim();
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
                        l_description = l_des.trim();
                      },
                    ),
                    TextField(
                      // obscureText: true,
                      maxLength: 20,
                      maxLines: 1,
                      decoration:
                      //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                      InputDecoration(
                        labelText: 'Адрес или название места',
                        labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      ),
                      onChanged: (String place) {
                        e_place = place.trim();
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
                            TextButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:DateTime.now(),
                                  lastDate: DateTime(2024),
                                ).then((value) {
                                  print("Selected date: $value");
                                  setState(() {
                                    e_Datetime = value!;
                                  });
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Дата     ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueGrey,
                                      fontFamily: 'Oswald',
                                    ),
                                  ),
                                  Text(
                                    e_Datetime != null
                                        ? "${e_Datetime.day}/${e_Datetime.month}/${e_Datetime.year}"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'Oswald',
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
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
                                      initialTime: TimeOfDay.now())..then((value) {
                                    //print("Selected date: $value");
                                    setState(() {
                                      e_dateTime = value!;
                                    });
                                  });
                                },
                                  child:
                                  Row(
                                    children: [
                                      Text('Время начала' + "      ",
                                          style: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald')),
                                      Text(
                                          e_dateTime.hour.toString() + ":" + e_dateTime.minute.toString(),
                                          style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Oswald')
                                      ),
                                    ],
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
                            // Column(
                            //   children: [
                            //     SizedBox(width: 25,)
                            //   ],
                            // ),
                            // Column(
                            //   children: [
                            //     Text(
                            //       e_dateTime.hour.toString() + ":" + e_dateTime.minute.toString(),
                            //       style: TextStyle(fontSize: 17, color: Colors.black, fontFamily: 'Oswald'),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment,
                        children: [
                          SizedBox(width: 10,),
                          TextButton(onPressed: (){
                            openUrlInBrowser(Uri.parse(create_bot_link));
                          },
                            child: Text("Создать чат участников",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: 'Oswald'
                                )
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 247, 190, 59),),
                              //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-5,10))
                            ),
                          ),
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Center(
                                    child: Text("Зачем это нужно?",
                                      style:
                                      TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Oswald',
                                        color: Colors.black,
                                      ),),
                                  ),
                                  content:
                                  SizedBox(
                                    height: 220,
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Для обмена личными данными (к примеру, номерами) между участниками события, создателю мероприятия необходимо создать общий чат с помощью бота в Telegram.",
                                        ),
                                        Text(
                                            "После создания чата скопируйте ссылку на него и вставьте в следующее поле."
                                        ),
                                      ],
                                    ),
                                  )
                              );
                            });
                          },
                            icon: Icon(
                                Icons.info_outline
                            ),
                            color: Colors.grey,
                            iconSize: 15,
                          )
                        ]
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      // obscureText: true,
                      maxLength: 20,
                      maxLines: 1,
                      decoration:
                      //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                      InputDecoration(
                        labelText: 'Вставьте ссылку на чат участников',
                        labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                        contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      ),
                      onChanged: (String url) {
                        event_chat_url = url.trim();
                      },
                    ),
                    // WebView(
                    //   initialUrl: 'https://flutter.dev',
                    //   navigationDelegate: (NavigationRequest request){
                    //     if(request.url.startsWith('https://flutter.dev')){
                    //       return NavigationDecision.navigate;
                    //     }
                    //     _launchURL(request.url);
                    //     return NavigationDecision.prevent;
                    //   },
                    // ),
                    Center(
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 14,),
                          Text("Добавьте фото места/референсы мероприятия",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey,
                              //fontFamily: 'Oswald'
                            )
                            ,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10,),
                          TextButton(onPressed: (){
                            if((pic1Url == null)||(pic2Url == null)) {
                              // setState(() {
                              //   event_pics.add(PhotoItem(
                              //       imagePath: 'assets/test_photo' + '_' +
                              //           (event_pics.length + 1).toString() +
                              //           '.jpg'));
                              //   //event_images.add(AssetImage('assets/wom.jpeg'));
                              // });
                              pickImage();
                            }
                            else if((pic1Url != null)&&(pic2Url != null)){
                              showDialog(context: context, builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(
                                    child: Text("Вы можете добавить только 2 фотографии",
                                      style:
                                      TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Oswald',
                                        color: Colors.black,
                                      ),),
                                  ),
                                );
                              });
                            }
                          },
                            child: Text("Добавить фото",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontFamily: 'Oswald'
                                )
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 247, 190, 59),),
                              //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-5,10))
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 25,),
                    Column(
                      children: [
                        add_e_image(pic1Url),
                        SizedBox(height: 10,),
                        add_e_image(pic2Url),
                        SizedBox(height: 20,),
                      ],
                      // ListView.builder(
                      //     itemCount: event_pics.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       final photoItem = event_pics[index];
                      //       if (image_count < 3) {
                      //         return Dismissible(
                      //           key: UniqueKey(),
                      //           child: Column(
                      //             children: [
                      //               Image(
                      //                 image: AssetImage(photoItem.imagePath),
                      //                 fit: BoxFit.fitWidth,
                      //                 width: 300,
                      //                 height: 200,
                      //               ),
                      //               SizedBox(
                      //                 height: 10,
                      //               )
                      //             ],
                      //           ),
                      //           onDismissed: (direction) {
                      //             if (direction == DismissDirection.endToStart) {
                      //               setState(() {
                      //                 event_pics.removeAt(index);
                      //               });
                      //             }
                      //           },
                      //         );
                      //       } else {}
                      //
                      //     }
                      // ),
                    ),
                    // TextField(
                    //   // obscureText: true,
                    //   maxLength: 8,
                    //   maxLines: 1,
                    //   decoration:
                    //   //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    //   InputDecoration(
                    //     labelText: '???? ? ?????',
                    //     labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                    //     contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    //   ),
                    //   onChanged: (String date) {
                    //     e_date = date;
                    //   },
                    // ),
                    //
                    // TextField(
                    //   // obscureText: true,
                    //   maxLength: 5,
                    //   maxLines: 1,
                    //   decoration:
                    //   //Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),),
                    //   InputDecoration(
                    //     labelText: '?????',
                    //     labelStyle: TextStyle(fontSize: 17, color: Colors.blueGrey, fontFamily: 'Oswald'),
                    //     contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    //   ),
                    //   onChanged: (String time) {
                    //     e_time = time;
                    //   },
                    // ),
                    // TextButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       //bool fool = true;
                    //       if(!((e_name.length > 0)&&(s_description.length > 0)&&(l_description.length > 0)&&(e_place.length > 0)&&(e_date.length > 0)&&(e_time.length > 0))){
                    //         print("??????? ?? ?????????!!");
                    //       }
                    //       else {
                    //         Events_list.add(Event());
                    //         Events_list.last.name = e_name.trim();
                    //         Events_list.last.short_description = s_description.trim();
                    //         Events_list.last.long_description = l_description.trim();
                    //         Events_list.last.place = e_place.trim();
                    //         // Events_list.last.date = e_date.trim();
                    //         // Events_list.last.time = e_time.trim();
                    //
                    //         //Events_list.last.id = index;
                    //         not_first = true;
                    //         //if(not_first == true){
                    //         e_name = "";
                    //         s_description = "";
                    //         l_description = "";
                    //         e_place = "";
                    //         e_date = "";
                    //         e_time = "";
                    //         //}
                    //       }
                    //     });
                    //   },
                    //
                    //   child: Text('???????? ???????', style:
                    //   TextStyle(
                    //     fontSize: 18,
                    //     color: Colors.white,
                    //     fontFamily: 'Oswald',
                    //   ),
                    //   ),
                    //   style: ButtonStyle(
                    //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    //       backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 16, 79, 58),),
                    //       minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-20,40))
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 16, 79, 58),
            onPressed: () {
              setState(() {
                Event_index = events_add_page.length ;
                events_add_page.add(Event());
                //sortByNearestDate(events_add_page);
                events_add_page.last.setEvent_autor(Users.last);
                events_add_page.last.setName(e_name);
                events_add_page.last.setShortDescription(s_description);
                events_add_page.last.setLongDescription(l_description);
                events_add_page.last.setPlace(e_place);
                events_add_page.last.setCategory(event_type);
                events_add_page.last.setTime(e_dateTime);
                events_add_page.last.setDate(e_Datetime);
                events_add_page.last.setChatLink(event_chat_url);
                events_add_page.last.setIndex(events_add_page.length);
                events_add_page.last.setPic1(pic1Url);
                events_add_page.last.setPic2(pic2Url);
                print(events_add_page.length);
              });
              Navigator.push(context, PageTransition(
                  type: PageTransitionType.fade,
                  // duration: Duration.millisecondsPerSecond(),
                  alignment: Alignment.center,
                  child: Event_page(key: Key(events_add_page.last.index.toString()))));
            },
            child: SvgPicture.asset(
              'assets/add_icon.svg',
              // Укажите размер изображения
              width: 30,
              height: 30,
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
                                'Обзор',
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.0)),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 16, 79, 58),
                                      width: 1.7,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Профиль',
                                style:
                                TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Oswald',
                                  color: Color.fromARGB(255, 16, 79, 58),
                                ),
                              )
                            ],
                          )
                        ],),
                    )
                ),
              )
          ),
        ));
  }
  void openUrlInBrowser(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}





















