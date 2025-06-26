import 'package:chatso/view/bottom_nav.dart';
import 'package:chatso/view/forget_password.dart';
import 'package:chatso/view/home.dart';
import 'package:chatso/view/login_page.dart';
import 'package:chatso/view/sales.dart';
import 'package:chatso/view/sign_page.dart';
import 'package:chatso/view/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => MySplash()),
    GoRoute(path: '/login', builder: (context, state) => MyLogin()),
    GoRoute(path: '/register', builder: (context, state) => MyRegister()),
    GoRoute(path: '/forgotPass',builder: (context, state) => ForgetPass(),),
    GoRoute(path: '/home',builder: (context, state) => MyHome(),),
    GoRoute(path: '/bottomBar',builder: (context, state) => MyBottomBar(),),
    GoRoute(path: '/sales',builder: (context, state) => AddProductPage())
  ],
);
