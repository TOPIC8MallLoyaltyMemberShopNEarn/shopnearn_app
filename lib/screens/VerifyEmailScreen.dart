import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController _verificationCodeController = TextEditingController();
  bool isCodeValid = false;

  void _verifyEmail() {
    // Mengambil kode verifikasi yang dimasukkan pengguna
    String enteredCode = _verificationCodeController.text;

    // Kode verifikasi yang benar (contoh)
    String correctCode = "123456";

    // Memeriksa apakah kode yang dimasukkan sesuai dengan kode yang benar
    if (enteredCode == correctCode) {
      setState(() {
        isCodeValid = true;
      });
    } else {
      setState(() {
        isCodeValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifikasi Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Kami telah mengirimkan kode verifikasi ke alamat email Anda. Silakan periksa email Anda dan masukkan kode verifikasi di bawah ini:",
            ),
            TextFormField(
              controller: _verificationCodeController,
              decoration: InputDecoration(labelText: 'Kode Verifikasi'),
            ),
            ElevatedButton(
              onPressed: _verifyEmail,
              child: Text("Verifikasi Email"),
            ),
            SizedBox(height: 16.0),
            if (isCodeValid)
              Text(
                "Email Anda berhasil diverifikasi!",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            else if (_verificationCodeController.text.isNotEmpty)
              Text(
                "Kode verifikasi tidak valid. Coba lagi.",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
