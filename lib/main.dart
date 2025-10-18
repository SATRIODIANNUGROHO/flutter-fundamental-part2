import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// MODEL ITEM
class Item {
  final String name;
  final String location;
  final String imagePath;
  final int stock;
  final double rating;

  Item({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.stock,
    required this.rating,
  });
}

// HALAMAN UTAMA
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
      Item(
        name: 'Tokyo Tower',
        location: 'Tokyo, Jepang',
        imagePath: 'assets/images/tokyo_tower.jpg',
        stock: 10,
        rating: 4.9,
      ),
      Item(
        name: 'Osaka Castle',
        location: 'Osaka, Jepang',
        imagePath: 'assets/images/osaka_castle.jpg',
        stock: 6,
        rating: 4.6,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Wisata Jepang'),
        backgroundColor: Colors.teal,
      ),
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
              context.push('/item', extra: item);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: item.name,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        item.imagePath,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Stok: ${item.stock}'),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 16),
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

// HALAMAN DETAIL ITEM
class ItemPage extends StatelessWidget {
  final Item item;
  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.teal,
      ),
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
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(item.location,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    Text(item.rating.toString()),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Stok tersedia: ${item.stock}'),
                const SizedBox(height: 16),
                const Text(
                  'Deskripsi Produk:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Produk ini merupakan destinasi wisata terkenal yang menawarkan pemandangan indah dan budaya khas Jepang. '
                  'Tempat ini menjadi tujuan populer wisatawan dari seluruh dunia karena keindahan dan nilai sejarahnya.',
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

// MAIN DENGAN GO_ROUTER
void main() {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/item',
        builder: (context, state) {
          final item = state.extra as Item;
          return ItemPage(item: item);
        },
      ),
    ],
  );

  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: router,
    title: 'Toko Wisata Jepang',
    theme: ThemeData(primarySwatch: Colors.teal),
  ));
}