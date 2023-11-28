import 'package:flutter/material.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  TextEditingController productControllerText = TextEditingController();
  TextEditingController hargaControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tambah Produk'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          TextField(
            controller: productControllerText,
            decoration: InputDecoration(hintText: 'produk'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: hargaControllerText,
            decoration: InputDecoration(hintText: 'harga'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text('save')),
        ],
      ),
    );
  }
}
