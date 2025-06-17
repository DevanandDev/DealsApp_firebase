import 'package:chatso/widgets/authWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySales extends StatelessWidget {
  const MySales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
          }, child: text(text: 'logout')),
          
        ],
      ),
    );
  }
}