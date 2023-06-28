

import 'package:flutter/material.dart';

Widget buildAvatar(String? avatarURL) {
  if (avatarURL == null) {
    return ClipOval(
      child: Image.asset(
        '../assets/default_avatar.jpeg',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    // );CircleAvatar(
    //   radius: 75, // half of the desired width and height of the default image
    //     backgroundImage: AssetImage('../assets/default_avatar.jpeg',
    //     ),

    ); // or any other default widget to show when the URL is null
  }
  return ClipOval(
    child: Image.network(
      avatarURL,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    ),
  );
}
