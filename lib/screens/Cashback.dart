import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart'; // Import paket barcode_widget

class CashbackScreen extends StatelessWidget {
  final String title;

  CashbackScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/cashback.jpg'), // Ganti dengan gambar cashback yang sesuai
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Cashback', // Judul tindakan dengan gaya yang lebih menarik
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Dapatkan cashback 10% di setiap transaksi.', // Deskripsi penawaran dengan gaya yang lebih menarik
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                            BarcodeWidget(
                              barcode: Barcode
                                  .qrCode(), // Jenis barcode yang digunakan (QR Code)
                              data:
                                  'Kode Cashback Anda', // Ganti dengan data kode cashback yang sesuai
                              color: Colors.black, // Warna kode cashback
                              backgroundColor: Colors
                                  .white, // Warna latar belakang kode cashback
                              width: 200,
                              height: 200,
                            ),
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
                  'Dapatkan cashback 10% di setiap transaksi.', // Deskripsi penawaran
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
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
                      '1. Penawaran berlaku hingga 31 Desember 2023.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Kode cashback harus ditunjukkan saat transaksi.',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      '2. Hanya berlaku untuk transaksi di toko-toko berpartisipasi.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Syarat dan ketentuan tambahan berlaku.',
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CashbackScreen(title: 'Cashback'),
  ));
}
