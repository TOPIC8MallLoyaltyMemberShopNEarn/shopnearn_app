import 'package:flutter/material.dart';

class PromoGadgetScreen extends StatelessWidget {
  final String title;

  PromoGadgetScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Gambar dan latar belakang
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gadget_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Promo Gadget',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Hemat 15% untuk semua produk gadget.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tombol "Gunakan Penawaran"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika ketika tombol "Gunakan Penawaran" diklik
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Scan kode untuk menggunakan.'),
                          SizedBox(height: 16),
                          // Ganti dengan widget Barcode sesuai kebutuhan
                          // Contoh: BarcodeWidget(...)
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Tutup'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Warna tombol
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Gunakan Penawaran',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),

          // Deskripsi Penawaran
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Deskripsi Penawaran:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: ListTile(
              title: Text(
                'Hemat 15% untuk semua produk gadget.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),

          // Syarat dan Ketentuan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Syarat dan Ketentuan:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    '1. Promo berlaku hingga 31 Desember 2023.',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Kode promo harus digunakan saat pembelian.',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    '2. Promo hanya berlaku untuk produk gadget.',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Syarat dan ketentuan tambahan mungkin berlaku.',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
