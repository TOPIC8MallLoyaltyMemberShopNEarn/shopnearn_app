import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopnearn_app/screens/VerifyEmailScreen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> saveUserDataToDatabase(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final userData = {
        'nama': _namaController.text,
        'alamat': _alamatController.text,
        'nomorTelepon': _nomorTeleponController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      };

      // Validasi jika semua formulir telah terisi
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        // Simpan data pengguna ke penyimpanan lokal
        await prefs.setString('userData', userData.toString());

        // Navigasi ke halaman verifikasi email setelah mendaftar
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => VerifyEmailScreen(),
          ),
        );
      }
    } catch (error) {
      print("Error saving user data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendaftaran"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi nama';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi alamat';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nomorTeleponController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi nomor telepon';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap isi password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // Memvalidasi semua formulir sebelum melanjutkan
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    await saveUserDataToDatabase(context);
                  }
                },
                child: Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
