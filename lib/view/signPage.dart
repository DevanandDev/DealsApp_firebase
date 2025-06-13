import 'package:chatso/controller/authProvider.dart';
import 'package:chatso/view/loginPage.dart';
import 'package:chatso/widgets/authWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController confirmPassControler = TextEditingController();
    final authController = Provider.of<Authprovider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.15,
          ),
          child: Column(
            children: [
              Text(
                'Hello! Register your details here. ',
                style: GoogleFonts.poppins(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.055),
              textForm(
                acontroller: authController.nameController,
                prefix: Icon(Icons.person),
                hText: 'username',
              ),
              SizedBox(height: height * 0.01),
              textForm(
                acontroller: authController.rEmailController,
                prefix: Icon(Icons.email_outlined),
                hText: 'email',
              ),
              SizedBox(height: height * 0.01),
              textForm(
                acontroller: authController.rPasswordController,
                prefix: Icon(Icons.lock_outline_sharp),
                hText: 'password',
              ),
              SizedBox(height: height * 0.01),
              textForm(
                acontroller: confirmPassControler,
                prefix: Icon(Icons.lock_open_sharp),
                hText: 'confirm password',
              ),
          
              SizedBox(height: height * 0.055),
              eButton(
                presse: () async {
                  await authController.registerProvider();
                },
                text: 'Sign in',
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black, thickness: 0.1)),
                  SizedBox(width: width * 0.05),
                  text(text: 'Or Register With'),
                  SizedBox(width: width * 0.05),
                  Expanded(child: Divider(color: Colors.black, thickness: 0.1)),
                ],
              ),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.05,
                      width: width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 192, 191, 191),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.google,size: 20,),
                    ),
                  ),
                  SizedBox(width: width * 0.09),
                  Container(
                    height: height * 0.05,
                      width: width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 192, 191, 191),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.phone,size: 20,),
                    ),
                  ),
                  SizedBox(width: width * 0.09),
                  Container(
                    height: height * 0.05,
                      width: width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 192, 191, 191),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.user,size: 20,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(text: 'Already have an account ? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => MyLogin()),
                      );
                    },
                    child: text(
                      text: 'Log In',
                      colors: const Color.fromARGB(255, 83, 143, 255),
                      fontweights: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
