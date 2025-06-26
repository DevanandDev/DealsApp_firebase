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

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Productaddprovider>();
    return Scaffold(
      appBar: AppBar(),

      body:
          provider.isLoding
              ? CircularProgressIndicator()
              : Column(
                children: [
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
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: 'description'),
                  ),
                  eButton(text: 'Submit', presse: (){})
                ],
              ),
    );
  }
}
