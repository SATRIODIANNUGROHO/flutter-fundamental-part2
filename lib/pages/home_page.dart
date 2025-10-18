import 'package:flutter/material.dart';
import '../models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Wisata Jepang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        // map route to ItemPage instance that reads ModalRoute in build
        '/item': (context) => const ItemPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Yasaka Pagoda',
        location: 'Kyoto, Jepang',
        imagePath: 'assets/images/kyoto.jpg',
        stock: 12,
        rating: 4.8,
      ),
      Item(
        name: 'Gunung Fuji',
        location: 'Yamanashi, Jepang',
        imagePath: 'assets/images/fuji.jpg',
        stock: 8,
        rating: 4.7,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Toko Wisata Jepang')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              // send item as arguments
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: item.name, // unique tag
                    child: Image.asset(
                      item.imagePath,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(item.location,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text('Stok: ${item.stock}'),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 16),
                            Text(item.rating.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // read argument safely
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! Item) {
      // graceful fallback if argument missing or wrong type
      return Scaffold(
        appBar: AppBar(title: const Text('Item')),
        body: const Center(child: Text('Data item tidak tersedia')),
      );
    }

    final Item item = args;

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: ListView(
        children: [
          Hero(
            tag: item.name,
            child: Image.asset(
              item.imagePath,
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
                Text(item.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(item.location, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(children: [const Icon(Icons.star, color: Colors.orange), Text(item.rating.toString())]),
                const SizedBox(height: 8),
                Text('Stok tersedia: ${item.stock}'),
                const SizedBox(height: 16),
                const Text('Deskripsi Produk:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Produk ini merupakan destinasi wisata terkenal yang menawarkan pemandangan indah dan budaya khas Jepang.'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8),
        child: Text('Satrio Dian Nugroho - 2341760113', textAlign: TextAlign.center),
      ),
    );
  }
}