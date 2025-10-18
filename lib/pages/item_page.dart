import 'package:flutter/material.dart';
import '../models/item.dart'; // pastikan file item.dart ada di folder lib/models/

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      body: ListView(
        children: [
          Hero(
            tag: itemArgs.name,
            child: Image.asset(
              itemArgs.imagePath,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemArgs.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  itemArgs.location,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    Text(itemArgs.rating.toString()),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Stok tersedia: ${itemArgs.stock}'),
                const SizedBox(height: 16),
                const Text(
                  'Deskripsi Produk:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Produk ini merupakan destinasi wisata terkenal yang menawarkan pemandangan indah dan budaya khas Jepang.',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Satrio Dian Nugroho - 2341760113',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}