import 'package:flutter/material.dart';
import 'package:item_list_with_api/controller/function.dart';
import 'package:item_list_with_api/controller/productController.dart';
import 'package:item_list_with_api/model/productModel.dart';
import 'package:item_list_with_api/view/productAdd.dart';
import 'package:item_list_with_api/view/productEdit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> products;
  late List<Product> filteredProducts;
  final editFilter = TextEditingController();

  @override
  void initState() {
    super.initState();
    products = [];
    filteredProducts = [];
    getData();
  }

  Future<void> getData() async {
    final List<Product> data = await getProduct();

    if (mounted) {
      setState(() {
        products = data;
        filteredProducts = data;
      });
    }
  }

  void filterProducts(String keyword) {
    setState(() {
      filteredProducts = products.where((product) {
        final productNameLower = product.produk.toLowerCase();
        final keywordLower = keyword.toLowerCase();

        return productNameLower.contains(keywordLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Produk"),
        actions: [
          IconButton(
            onPressed: () async {
              showLoadingIndicator(context, 'Reloading data');
              await getData();
              Navigator.pop(context);

              final snackBar = SnackBar(
                content: const Text('data telah diperbarui'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(mainContext).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        children: [
          // filter produk input widget
          Container(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: editFilter,
              onChanged: filterProducts,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Filter Produk',
                suffixIcon: IconButton(
                  onPressed: () {
                    editFilter.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: ((context, index) {
                int i = index + 1;
                return Container(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ProductEditScreen(
                                harga: products[index].harga,
                                product: products[index].produk,
                              )),
                        ),
                      );
                    },
                    leading: Text(i.toString()),
                    title: Text(
                      filteredProducts[index].produk,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Harga : ${filteredProducts[index].harga}'),
                    trailing: Icon(
                      Icons.delete_forever,
                      color: Colors.red.shade600,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ProductAddScreen())));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
