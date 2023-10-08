import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart'; // Import paket barcode_widget

class DiskonMakanScreen extends StatelessWidget {
  final String title;

  DiskonMakanScreen({required this.title});

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
                          'assets/resturant.jpg'), // Ganti dengan gambar restoran yang sesuai
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
                          'Diskon Makanan', // Judul tindakan dengan gaya yang lebih menarik
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Nikmati potongan 30% di restoran terpilih.', // Deskripsi penawaran dengan gaya yang lebih menarik
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
                                  'Kode Diskon Anda', // Ganti dengan data kode diskon yang sesuai
                              color: Colors.black, // Warna kode diskon
                              backgroundColor: Colors
                                  .white, // Warna latar belakang kode diskon
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
                  'Nikmati potongan 30% di restoran terpilih.', // Deskripsi penawaran
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
                          'Kode diskon harus ditunjukkan saat pembayaran.',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      '2. Hanya berlaku di restoran yang berpartisipasi.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Syarat dan ketentuan tambahan disesuaikan dengan restoran masing-masing.',
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
    home: DiskonMakanScreen(title: 'Diskon Makanan'),
  ));
}
