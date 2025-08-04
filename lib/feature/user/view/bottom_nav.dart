import 'package:chatso/feature/user/viewmodel/bottom_nav_provider.dart';
import 'package:chatso/feature/user/view/cart.dart';
import 'package:chatso/feature/user/view/home.dart';
import 'package:chatso/feature/user/view/profile.dart';
import 'package:chatso/feature/user/view/search.dart';
import 'package:chatso/feature/user/view/sales.dart';
import 'package:chatso/core/widgets/bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyBottomBar extends StatelessWidget {
  MyBottomBar({super.key});

  final List<Widget> pages = [
    MyHome(),
    MySearch(),
    MyCart(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Bottomnavprovider>(context);
    return Scaffold(
      body: pages[provider.index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        onPressed: () => context.push('/sales'),
        elevation:4,
        child: Icon(Icons.add, color: Colors.black),
      ),
      bottomNavigationBar: BottomAppBar(
        
       shape: CircularNotchedRectangle(),
       notchMargin: 13.0,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:<Widget> [
          buildNavItems(context, Icons.home, 0,label: 'Home'),
          buildNavItems(context, Icons.search, 1,label: 'Search'),
          SizedBox(width: 50,),
          buildNavItems(context, Icons.favorite, 2,label: 'Wishlist'),
          buildNavItems(context, Icons.person, 3,label: 'Profile'),
        ],
       ),
      ),
    );
  }
}
