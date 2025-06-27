import 'package:chatso/controller/product_fetch_provider.dart';
import 'package:chatso/widgets/auth_widget.dart';
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
      body: Consumer<ProductFetchProvider>(
        builder: (context, value, child) {
          if (value.isLoding) {
            return Center(child: CircularProgressIndicator());
          }

          if (value.productList.isEmpty) {
            return Center(child: Text("No products found"));
          }

          return ListView.builder(
            itemCount: value.productList.length,
            itemBuilder: (context, index) {
              final product = value.productList[index];

              final name = product['name'] ?? 'No name';
              final price = product['price'] ?? 'No price';
              final description = product['description'] ?? 'No description';
              final List images = product['images'] ?? [];

              return Card(
                margin: EdgeInsets.all(10),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (images.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            images[0],
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      SizedBox(height: 10),
                      Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("₹$price", style: TextStyle(fontSize: 16, color: Colors.green)),
                      SizedBox(height: 5),
                      Text(description),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
