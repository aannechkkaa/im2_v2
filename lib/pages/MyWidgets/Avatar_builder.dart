

import 'package:flutter/material.dart';

Widget buildAvatar(String? avatarURL) {
  if (avatarURL == null) {
    return CircleAvatar(
      child: Image.network(
        'https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
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
