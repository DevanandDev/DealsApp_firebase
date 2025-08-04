import 'dart:io';

import 'package:chatso/feature/user/viewmodel/add_users_provider.dart';
import 'package:chatso/feature/user/viewmodel/image_add_provider.dart';
import 'package:chatso/data/models/product_model.dart';
import 'package:chatso/core/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mysales extends StatefulWidget {
  Mysales({super.key});

  @override
  State<Mysales> createState() => _MysalesState();
}

TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController descrptionController = TextEditingController();

class _MysalesState extends State<Mysales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: text(
          text: 'Add Products',
          fontSize: 18,
          fontweights: FontWeight.w600,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Consumer<ImageAddProvider>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () => value.pickImage(),
                    child: Container(
                      width: 250,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 230, 230, 230),
                      ),

                      child:
                          value.selectedImages.isEmpty
                              ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image, size: 30),
                                  text(text: 'Add Images', fontSize: 12),
                                ],
                              )
                              : GridView.builder(
                                itemCount: value.selectedImages.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 3,
                                      mainAxisSpacing: 3,
                                    ),
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    child: Image.file(
                                      File(value.selectedImages[index].path),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  );
                                },
                              ),
                    ),
                  );
                },
              ),
              SizedBox(height: 50),
              textForm(
                acontroller: nameController,
                prefix: Icon(Icons.person),
                hText: 'Name',
              ),
              SizedBox(height: 10),
              textForm(
                acontroller: priceController,
                prefix: Icon(Icons.currency_rupee),
                hText: 'Price',
              ),
              SizedBox(height: 10),
              TextField(
                maxLines: 4,
                controller: descrptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  alignLabelWithHint: true,
                  isCollapsed: false,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: Icon(Icons.message),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Consumer2<ImageAddProvider, AddUsersProvider>(
                builder: (context, imageData, userData, child) {
                  return eButton(
                    text: 'Upload',
                    presse: () async {
                      final imageUrl = await imageData.uploadImages();
                      final product = ProductModel(
                        name: nameController.text.trim(),
                        price: double.parse(priceController.text.trim()),
                        description: descrptionController.text.trim(),
                        image: imageUrl,
                      );
                      await userData.userAdd(product);

                      nameController.clear();
                      descrptionController.clear();
                      priceController.clear();
                      imageData.clearAll();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: text(text: 'Product added successfully'),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
