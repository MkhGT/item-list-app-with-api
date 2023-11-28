import 'package:flutter/material.dart';

class ProductEditScreen extends StatefulWidget {
  int harga;
  String product;
  ProductEditScreen({super.key, required this.harga, required this.product});

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  TextEditingController productControllerText = TextEditingController();
  TextEditingController hargaControllerText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      productControllerText.text = widget.product;
      hargaControllerText.text = widget.harga.toString();
    });
  }

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
        title: Text('Edit Produk'),
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
          ElevatedButton(onPressed: () {}, child: Text('Update')),
        ],
      ),
    );
  }
}
