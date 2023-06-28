import 'package:flutter/material.dart';

Widget home_pics_builder(BuildContext context, String? imageUrl) {
  if(imageUrl == null){
    return Container();
  }
  else{

    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl ?? '', // use empty string as fallback for null imageUrl
          fit: BoxFit.cover,
        ),
      ),
    );

  }



}