import 'package:chatso/feature/user/viewmodel/product_fetch_provider.dart';
import 'package:chatso/core/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductFetchProvider>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          leading: Column(
            children: [
              Image.asset('assets/icons8-handshake-heart-72.png', width: 30),
              text(text: 'DealS'),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Icon(Icons.live_help_outlined, size: 30),
            ),
          ],
        ),
      ),
      body:Column(
        children: [
         TextField(
          onChanged: (value) {
            
          },
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
         )
        ],
      )
    );
  }
}
