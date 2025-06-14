import 'package:chatso/controller/authProvider.dart';
import 'package:chatso/firebase_options.dart';
import 'package:chatso/router/routers.dart';
import 'package:chatso/view/loginPage.dart';
import 'package:chatso/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Authprovider(),)
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
   debugShowCheckedModeBanner: false,
    );
  }
}