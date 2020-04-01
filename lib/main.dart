import 'package:chat/chat_screen.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatScreen(),
    theme: ThemeData(
      primaryColor: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
    ),
  ));
}
