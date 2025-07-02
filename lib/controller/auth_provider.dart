import 'package:chatso/services/auth_services.dart';
import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rEmailController = TextEditingController();
  TextEditingController rPasswordController = TextEditingController();

  AuthService service = AuthService();

  Future<void> registerProvider() async {
    try {
      await service.registerService(
        name: nameController.text.trim(),
        email: rEmailController.text.trim(),
        password: rPasswordController.text.trim(),
      ); 
    } catch (e) {
      throw Exception('already taken ${e}');
    }
  }

  Future<void> loginProvider(BuildContext context) async {
    try {
      await service.loginService(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    rEmailController.dispose();
    rPasswordController.dispose();
    super.dispose();
  }
}
