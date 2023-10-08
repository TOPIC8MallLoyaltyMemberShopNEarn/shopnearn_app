import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Kue Terang Bulan Makn...",
      // name: "Kue Terang Bulan Maknyus / Martabak Manis",
      price: "Rp 48.000",
      imageUrl: "assets/martabakmanis.jpeg",
    ),
    Product(
      name: "PIZZA LEZAT UKURAN 20...",
      // name: "PIZZA LEZAT UKURAN 20CM KHUSUS PENGIRIMAN JABODETABEK (TERSEDIA BANYAK VARIANT)",
      price: "Rp 24.000",
      imageUrl: "assets/pizza.jpeg",
    ),
    Product(
      name: "Pizza Hut L1mo Flavors...",
      // name: "Pizza Hut L1mo Flavors. pizza hut 1 meter limo",
      price: "Rp 350.000",
      imageUrl: "assets/limo-pizza.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Layanan Food'),
        ),
        // body: Center(
        //   child: Text('Ini adalah layar Food'),
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
