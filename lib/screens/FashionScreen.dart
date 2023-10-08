import 'package:flutter/material.dart';

class FashionScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Kaos Pria T-Shirt Distro",
      price: "Rp 50.000",
      imageUrl: "assets/kaosdistro.jpg",
    ),
    Product(
      name: "Jam Tangan Pria Digital...",
      // name: "Jam Tangan Pria Digital Touch Screen",
      price: "Rp 195.000",
      imageUrl: "assets/jamtangan.jpg",
    ),
    Product(
      name: "Air Jordan 1 Mid",
      price: "Rp 1.650.000",
      imageUrl: "assets/sepatu.jpg",
    ),
    Product(
      name: "Kemeja Pria Lengan Panjang",
      price: "Rp 95.000",
      imageUrl: "assets/kemeja.jpg",
    ),
    Product(
      name: "House of Smith Jaket Varsity",
      price: "Rp 500.000",
      imageUrl: "assets/jaket.jpg",
    ),
    Product(
      name: "Uniqlo T-Shirt Pria Lengan...",
      // name: "Uniqlo T-Shirt Pria Lengan Pendek",
      price: "Rp 259.000",
      imageUrl: "assets/kaos.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layanan Fashion'),
      ),
      body: ListView(
        children: <Widget>[
          ProductRow(products: products.sublist(0, 3)),
          ProductRow(products: products.sublist(3, 6)),
        ],
      ),
    );
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
            onPressed: () async {
              // Tambahkan logika untuk menambahkan produk ke daftar pembelian
            },
            child: Text("Tambahkan ke Daftar Pembelian"),
          ),
        ],
      ),
    );
  }
}
