import 'package:flutter/material.dart';

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> beritaList = const [
    {
      'judul': 'Teknologi AI Terbaru 2025',
      'deskripsi': 'AI kini semakin canggih dan digunakan di berbagai bidang.'
    },
    {
      'judul': 'Cuaca Ekstrem di Indonesia',
      'deskripsi': 'BMKG memprediksi hujan lebat akan terjadi di beberapa wilayah.'
    },
    {
      'judul': 'Flutter 4.0 Dirilis',
      'deskripsi': 'Versi baru Flutter hadir dengan performa yang lebih cepat.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berita Terkini')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: beritaList.length,
          itemBuilder: (context, index) {
            final berita = beritaList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(berita['judul']!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(berita['deskripsi']!,
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
