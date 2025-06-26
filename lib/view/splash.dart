import 'package:chatso/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  
  @override
  void initState() {
   checkLog();
  }

  Future<void> checkLog()async{
   await Future.delayed(Duration(seconds: 5));
   final user = await FirebaseAuth.instance.currentUser;

   if (user != null) {
     context.go('/bottomBar');    
   }
   else{
    context.go('/login');
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/Animation - 1749533426937.json'),
          SizedBox(height: 100),
          Text(
            'Hot deals,',
            style: GoogleFonts.aboreto(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' cooler prices',
            style: GoogleFonts.aboreto(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
