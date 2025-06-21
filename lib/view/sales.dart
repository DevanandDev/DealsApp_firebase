import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;

class SellProductPage extends StatefulWidget {
  @override
  _SellProductPageState createState() => _SellProductPageState();
}

class _SellProductPageState extends State<SellProductPage> {
  List<XFile> _selectedImages = [];
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final picker = ImagePicker();
  bool isLoading = false;

  Future<void> _pickMultipleImages() async {
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      setState(() => _selectedImages = pickedImages);
    }
  }

  Future<void> _uploadProduct() async {
    if (_selectedImages.isEmpty ||
        _nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields & images required!')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      List<String> imageUrls = [];

      for (XFile image in _selectedImages) {
        String fileName = path.basename(image.path);
        final ref = FirebaseStorage.instance.ref('products/$fileName');
        await ref.putFile(File(image.path));
        String downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }

      await FirebaseFirestore.instance.collection('products').add({
        'name': _nameController.text,
        'price': _priceController.text,
        'description': _descController.text,
        'images': imageUrls,
        'timestamp': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product uploaded successfully!')),
      );

      
      _nameController.clear();
      _priceController.clear();
      _descController.clear();
      setState(() => _selectedImages = []);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sell Product")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickMultipleImages,
              child: Container(
                height: 200,
                color: Colors.grey[300],
                child: _selectedImages.isEmpty
                    ? Center(child: Icon(Icons.add_photo_alternate, size: 50))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              File(_selectedImages[index].path),
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price (₹)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _uploadProduct,
                    child: Text("Upload Product"),
                  ),
          ],
        ),
      ),
    );
  }
}
