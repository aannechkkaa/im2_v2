// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
//
// class ZoomableImage extends StatelessWidget {
//   String? imageUrl;
//
//
//   ZoomableImage({required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               backgroundColor: Colors.transparent,
//               content: SizedBox(
//
//                 width: MediaQuery.of(context).size.width * 0.95,
//                 //height: MediaQuery.of(context).size.height * 0.6,
//                 child: Image.network(
//                   imageUrl,
//                   width: MediaQuery.of(context).size.width * 0.95,
//                   //height: MediaQuery.of(context).size.height * 0.6,
//                   fit: BoxFit.cover,
//                 ),
//
//               ),
//             );
//           },
//         );
//       },
//       child:
//       Container(
//         width: MediaQuery.of(context).size.width * 0.3, // динамическая ширина
//         height: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), // скругление углов контейнера
//           color: Colors.white, // цвет фона контейнера
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10), // скругление углов изображения
//           child:
//           Image.network(imageUrl,
//             fit: BoxFit.cover,),
//         ),
//       ),
//     );
//   }
// }
//

