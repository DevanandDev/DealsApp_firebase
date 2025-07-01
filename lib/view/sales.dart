import 'dart:io';

import 'package:chatso/controller/image_add_provider.dart';
import 'package:chatso/widgets/auth_widget.dart';
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
                                      mainAxisSpacing: 3
                                    ),
                                itemBuilder: (context, index) {
                                 return ClipRRect(
                                     child: Image.file(File(value.selectedImages[index].path),fit: BoxFit.cover,),
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
                  ),SizedBox(height: 10),
                  textForm(
                    acontroller: priceController,
                    prefix: Icon(Icons.currency_rupee),
                    hText: 'Price',
                  ),SizedBox(height: 10),
                  textForm(
                    acontroller: descrptionController,
                    prefix: Icon(Icons.message),
                    hText: 'Description',
                    maxlines: 3  
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
