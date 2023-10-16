import 'package:flutter/material.dart';
import 'package:food_recipe/res/custom_color.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.green,
        title: Center(child: Text("Message")),
      ),
      body: Center(
        child: Text("No message"),
      ),
    );
  }
}
