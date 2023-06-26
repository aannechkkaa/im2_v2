

import 'package:flutter/material.dart';

Widget add_e_image(String? event_pic_URL) {
  if (event_pic_URL == null) {
    return Container(); // or any other default widget to show when the URL is null
  }
  return Image.network(
      event_pic_URL,
      width: 200,
      height: 150,
      fit: BoxFit.cover,
  );
}