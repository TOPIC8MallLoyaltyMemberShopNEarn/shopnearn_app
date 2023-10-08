import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body : Center ( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/profileicon.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              "Nama Pengguna",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Email: user@example.com",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              "Riwayat Transaksi",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Widget untuk menampilkan riwayat transaksi, gantilah dengan data yang sesuai
            // Jika tidak ada riwayat transaksi, Anda dapat menampilkan pesan peringatan.
            Text(
              "Belum ada riwayat transaksi yang dilakukan.",
               style: TextStyle(fontSize: 16.0),
             ),
          ],
        ),
      ),
    );
  }
}
