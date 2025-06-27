import 'dart:io';

import 'package:chatso/controller/product_add_provider.dart';
import 'package:chatso/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ImagePicker picked = ImagePicker();

  Future<void> pickImages(BuildContext context) async {
    final List<XFile> images = await picked.pickMultiImage();
    if (images.isNotEmpty) {
      context.read<Productaddprovider>().selectImages(images);
    }
  }

  void submitAllProduct(BuildContext context) async {
    final provider = await context.read<Productaddprovider>();

    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final description = descriptionController.text.trim();

    if (name.isEmpty || price.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: text(
            text: 'please fill all fields and select at least one image',
          ),
        ),
      );
      return;
    }
    try {
      await provider.addImageProvider(
        name: name,
        price: price,
        description: description,
      );
      nameController.clear();
      priceController.clear();
      descriptionController.clear();
      provider.selectImages([]);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: text(text: 'product added successfully')),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Productaddprovider>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Products',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:
          provider.isLoding
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          pickImages(context);
                        },
                        icon: Icon(Icons.image),
                        label: text(text: 'Pick Images'),
                      ),
                      SizedBox(height: 10),
                      if (provider.imageList.isNotEmpty)
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: provider.imageList.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                File(provider.imageList[index].path),
                                width: 100,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),

                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(hintText: 'name'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(hintText: 'price'),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLines: 4,
                        controller: descriptionController,
                        decoration: InputDecoration(hintText: 'description'),
                      ),

                      SizedBox(height: 20),
                      eButton(
                        text: 'Submit',
                        presse: () {
                          submitAllProduct(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
