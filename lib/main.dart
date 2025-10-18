import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/item': (context) => const ItemPage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      body: ListView(
        children: [
          // InkWell membungkus Card
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item');
            },
            child: Card(
              margin: const EdgeInsets.all(16),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/kyoto.jpg',
                  width: 80,
                  fit: BoxFit.cover,
                ),
                title: const Text('Yasaka Pagoda (Hokan-ji Temple)'),
                subtitle: const Text('Kyoto, Jepang'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Yasaka Pagoda (Hokan-ji Temple)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kyoto, Jepang',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Yasaka Pagoda, atau Hokan-ji Temple, adalah salah satu ikon terkenal di Kyoto, Prefektur Kyoto, Jepang. '
        'Pagoda lima tingkat ini terletak di kawasan bersejarah Higashiyama yang dikenal dengan jalan batu sempit dan rumah kayu tradisional bergaya Jepang. '
        'Bangunan ini berasal dari abad ke-6 dan sering menjadi latar foto karena pemandangannya yang menawan, terutama saat matahari terbenam. '
        'Area di sekitarnya menawarkan suasana klasik Jepang yang masih terjaga, menjadikannya tujuan populer bagi wisatawan yang ingin merasakan keindahan dan ketenangan kota tua Kyoto.\n\n'
        'Satrio Dian Nugroho\n'
        '2341760113',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Satrio Dian Nugroho (2341760113)'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/kyoto.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}