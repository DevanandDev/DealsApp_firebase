import 'package:chatso/controller/auth_provider.dart';
import 'package:chatso/view/login_page.dart';
import 'package:chatso/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController confirmPassControler = TextEditingController();
  @override
  void dispose() {
    final provider = Provider.of<Authprovider>(context, listen: false);
    provider.nameController.dispose();
    provider.emailController.dispose();
    provider.passwordController.dispose();
    confirmPassControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: _formKey,
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
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter username';
                    }
                  },
                ),
                SizedBox(height: height * 0.01),
                textForm(
                  acontroller: authController.rEmailController,
                  prefix: Icon(Icons.email_outlined),
                  hText: 'email',
                  validate: (value) { 
                    if (value == null || value.isEmpty) {
                      return 'please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'email is not correct';
                    }
                  },
                ),
                SizedBox(height: height * 0.01),
                textForm(
                  acontroller: authController.rPasswordController,
                  prefix: Icon(Icons.lock_outline_sharp),
                  hText: 'password',
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    }
                    if (value.length < 6) {
                      return 'enter atleast 6 characters';
                    }
                  },
                ),
                SizedBox(height: height * 0.01),
                textForm(
                  acontroller: confirmPassControler,
                  prefix: Icon(Icons.lock_open_sharp),
                  hText: 'confirm password',
                ),

                SizedBox(height: height * 0.055),
                eButton(
                  presse: () {
                    if (_formKey.currentState!.validate()) {
                      authController.registerProvider();
                    }
                    context.go('/login');
                  },
                  text: 'Sign in',
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.black, thickness: 0.1),
                    ),
                    SizedBox(width: width * 0.05),
                    text(text: 'Or Register With'),
                    SizedBox(width: width * 0.05),
                    Expanded(
                      child: Divider(color: Colors.black, thickness: 0.1),
                    ),
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
                        icon: FaIcon(FontAwesomeIcons.google, size: 20),
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
                        icon: FaIcon(FontAwesomeIcons.phone, size: 20),
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
                        icon: FaIcon(FontAwesomeIcons.user, size: 20),
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
                        context.go('/login');
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
      ),
    );
  }
}
