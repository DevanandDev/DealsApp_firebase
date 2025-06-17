import 'package:chatso/controller/authProvider.dart';
import 'package:chatso/services/authServices.dart';
import 'package:chatso/view/signPage.dart';
import 'package:chatso/widgets/authWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _auth = AuthService();

    final regController = Provider.of<Authprovider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.15,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Your deals waiting! Login to unlock savings',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  textForm(
                    acontroller: regController.emailController,
                    prefix: Icon(Icons.email_outlined),
                    hText: 'email',
                    validate: (value) {
                      if (value==null || value.isEmpty) {
                        return 'please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'email is not correct';
                      }
                    },
                  ),
                  SizedBox(height: height * 0.015),
                  textForm(
                    acontroller: regController.passwordController,
                    prefix: Icon(Icons.lock_outline_sharp),
                    hText: 'password',
                    validate: (value) {
                       if (value==null || value.isEmpty) {
                        return 'please enter your password';
                      }
                      if (value.length < 6) {
                        return 'enter atleast 6 characters';
                      }
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [GestureDetector(
                        onTap: () => context.push('/forgotPass'),
                        child: text(text: 'Forgot Password ?'))],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  eButton(
                    presse: () {
                     if (_formKey.currentState!.validate()) {
                        regController.loginProvider(context);
                        context.go('/home');
                     }
                    },
                    text: 'Login',
                  ),
                  SizedBox(height: height * 0.08),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black, thickness: 0.1)),
                      SizedBox(width: width * 0.05),
                      text(text: 'Or Login With'),
                      SizedBox(width: width * 0.05),
                      Expanded(child: Divider(color: Colors.black, thickness: 0.1)),
                    ],
                  ),
                  SizedBox(height: height * 0.07),
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
                          onPressed: () async{
                             await _auth.loginGoogle();
                          },
                          icon: FaIcon(FontAwesomeIcons.google,size: 20,),
                        ),
                      ),
                      SizedBox(width: width * 0.1),
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
                       SizedBox(width: width * 0.1),
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
                  SizedBox(height: height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(text: 'Don’t have an account ? '),
                      GestureDetector(
                        onTap: () {
                          context.push('/register');
                        },
                        child: text(
                          text: 'Sign In',
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
        ),
      ),
    );
  }
}
