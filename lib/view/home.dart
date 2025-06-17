import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(10), child: AppBar()),
      body: Column(
        children: [
          Image.asset('assets/icons8-handshake-heart-72.png',width: 30,),
          Text('DeALs',style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
