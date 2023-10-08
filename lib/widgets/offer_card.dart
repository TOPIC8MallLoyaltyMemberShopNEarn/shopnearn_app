import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final VoidCallback? onTap; // Tambahkan parameter onTap yang bersifat opsional

  OfferCard({
    required this.title,
    required this.description,
    required this.color,
    this.onTap, // Tandai parameter sebagai opsional
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Gunakan onTap dari parameter
      child: Container(
        width: 200.0,
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.local_offer,
                color: color,
                size: 30.0,
              ),
              SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
