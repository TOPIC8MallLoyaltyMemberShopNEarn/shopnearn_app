import 'package:flutter/material.dart';
import 'package:shopnearn_app/screens/Cashback.dart';
import 'package:shopnearn_app/screens/DiskonModern.dart';
import 'package:shopnearn_app/screens/DiskonSepatu.dart';
import 'package:shopnearn_app/screens/PromoElektronik.dart';
import 'package:shopnearn_app/screens/PromoGadget.dart';
import 'package:shopnearn_app/widgets/offer_card.dart';
import 'diskonmakan.dart';

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penawaran Khusus'),
      ),
      backgroundColor: Color.fromARGB(255, 207, 54, 253),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Penawaran saat ini',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OfferCard(
                      title: 'Diskon Makanan',
                      description: 'Potongan 30% di restoran terpilih.',
                      color: Colors.orange,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DiskonMakanScreen(title: 'Diskon Makanan');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OfferCard(
                      title: 'Cashback',
                      description: 'Dapatkan cashback hingga Rp 50.000.',
                      color: Colors.green,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CashbackScreen(title: 'Cashback');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OfferCard(
                      title: 'Promo Elektronik',
                      description: 'Hemat 20% untuk produk elektronik.',
                      color: Colors.blue,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return PromoElektronikScreen(title: 'Promo Elektronik');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OfferCard(
                      title: 'Diskon Mode',
                      description: 'Potongan harga hingga 50% untuk pakaian.',
                      color: Colors.red,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DiskonModernScreen(title: 'Diskon Mode');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OfferCard(
                      title: 'Promo Gadget',
                      description: 'Hemat 15% untuk semua produk gadget.',
                      color: Colors.teal,
                      onTap: () {
                        // Tindakan ketika kartu 'Promo Gadget' diklik
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return PromoGadgetScreen(title: 'Diskon Mode');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OfferCard(
                      title: 'Diskon Sepatu',
                      description: 'Potongan harga hingga 40% untuk sepatu.',
                      color: Colors.amber,
                      onTap: () {
                        // Tindakan ketika kartu 'Diskon Sepatu' diklik
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DiskonSepatuScreen(title: 'Diskon Mode');
                            },
                          ),
                        );
                      },
                    ),
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
