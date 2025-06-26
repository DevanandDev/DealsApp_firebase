import 'package:chatso/controller/auth_provider.dart';
import 'package:chatso/controller/bottom_nav_provider.dart';
import 'package:chatso/controller/product_add_provider.dart';
import 'package:chatso/firebase_options.dart';
import 'package:chatso/router/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lhreqzexpxlrmltlejtb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxocmVxemV4cHhscm1sdGxlanRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAyNDE2NTMsImV4cCI6MjA2NTgxNzY1M30.Z00EV89KApzzrug-dWL5kIOeRai8L0Wu12dHDZNX0IQ',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authprovider()),
        ChangeNotifierProvider(create: (context) => Bottomnavprovider()),
        ChangeNotifierProvider(create: (context) => Productaddprovider(),)
      ],
      child: MyApp(),
    ),
  );
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
