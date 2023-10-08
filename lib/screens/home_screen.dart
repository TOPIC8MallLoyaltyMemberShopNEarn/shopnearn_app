import 'package:flutter/material.dart';
import 'package:shopnearn_app/screens/offer_screen.dart';
import 'package:shopnearn_app/screens/profile_screen.dart';
import 'package:shopnearn_app/screens/service_screen.dart';
import 'package:shopnearn_app/screens/RegisterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShopN'earn",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 255, 255), // Ubah primarySwatch sesuai preferensi Anda
        fontFamily: 'Montserrat', // Ganti font sesuai preferensi Anda
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons
                .shop_two_sharp), // Ubah ikon di sini sesuai preferensi Anda
            SizedBox(width: 10.0), // Berikan sedikit spasi antara ikon dan teks
            Text(
              "ShopN'earn",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Ubah warna teks menjadi biru
              ),
            )
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white,
              ], // Ubah warna latar belakang menjadi biru
            ),
          ),
        ),
        centerTitle: true, // Menempatkan judul ke tengah
      ),
      backgroundColor:
          Color.fromARGB(255, 0, 0, 0), // Ubah warna latar belakang body menjadi biru
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ShopN'earn",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255), // Ubah warna teks menjadi putih
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)), // Change the button color
                  foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)), // Change the text color
                  overlayColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 156, 155, 155)), // Change the color when pressed
                  // Add a hover effect
                  mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.click),
                ),
              child: Text("Masuk"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)), // Change the button color
                  foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)), // Change the text color
                  overlayColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 156, 155, 155)), // Change the color when pressed
                  // Add a hover effect
                  mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.click),
                ),
              child: Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons
                  .shop_two_sharp), // Ubah ikon di sini sesuai preferensi Anda
              SizedBox(
                  width: 10.0), // Berikan sedikit spasi antara ikon dan teks
              Text(
                "ShopN'earn",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1), // Ubah warna teks menjadi biru
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Layanan',
                icon: Icon(Icons.shopping_bag),
              ),
              Tab(
                text: 'Penawaran',
                icon: Icon(Icons.local_offer),
              ),
            ],
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor:
            Colors.white, // Ubah warna latar belakang body menjadi putih
        body: TabBarView(
          children: [
            ServiceScreen(), // Pastikan import ServiceScreen telah dilakukan di atas
            OfferScreen(),
          ],
        ),
      ),
    );
  }
}
