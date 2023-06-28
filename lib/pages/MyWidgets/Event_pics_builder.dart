import 'package:flutter/material.dart';

Widget event_pics_builder(BuildContext context, String? imageUrl) {
  if(imageUrl == null){
    return Container();
  }
  else{

    return GestureDetector(
      onTap: () {
        if (imageUrl != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Image.network(
                    imageUrl,
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 100,
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
      ),
    );

  }



}
