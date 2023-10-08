import 'package:flutter/material.dart';

class PulsaScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Telkomsel",
      price: "",
      imageUrl: "assets/Telkomsel.jpg",
    ),
    Product(
      name: "Tri",
      price: "",
      imageUrl: "assets/Tri.jpg",
    ),
    Product(
      name: "XL Axiata",
      price: "",
      imageUrl: "assets/XLAxiata.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Layanan Pulsa'),
        ),
        // body: Center(
        //   child: Text('Ini adalah layar Pulsa'),
        // ),
        body: ListView(
          children: <Widget>[
            ProductRow(products: products.sublist(0, 3)),
          ],
        ));
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class ProductRow extends StatelessWidget {
  final List<Product> products;

  ProductRow({required this.products});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: products.map((product) {
        return ProductItem(product: product);
      }).toList(),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width / 3 - 16.0, // Lebar setiap produk
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: AspectRatio(
              aspectRatio: 1.0, // Mengatur rasio aspek gambar menjadi 1:1
              child: FittedBox(
                fit: BoxFit.cover, // Mengisi kotak dengan gambar tanpa memotong
                child: Image.asset(
                  product.imageUrl,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            product.name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.0),
          Text(
            product.price,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk menambahkan produk ke daftar pembelian
            },
            child: Text("Tambahkan ke Daftar Pembelian"),
          ),
        ],
      ),
    );
  }
}
