import 'package:chatso/widgets/authWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPass extends StatelessWidget {
  ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgetController = TextEditingController();

    Future<void> sbmt() async {
      final email = forgetController.text.trim();
      if (email.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('please enter your email')));
        return;
      }
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('password reset link send')));
        context.go('/login');
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error : $e')));
      }
    }

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.02,
                right: width * 0.09,
                top: height * 0.15,
              ),
              child: Text(
                'Forgot your password ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.09, right: width * 0.02),
              child: Text(
                '   We’ve got you covered ',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: width * 0.09, right: width * 0.09),
              child: textForm(
                acontroller: forgetController,
                prefix: Icon(Icons.key),
                hText: 'Enter your email',
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.only(left: width * 0.09, right: width * 0.09),
              child: eButton(
                text: 'submit',
                presse: () {
                  sbmt();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
