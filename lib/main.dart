import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Card List Example'),
          backgroundColor: Colors.amber,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('assets/images/logo.png', height: 30),
            ),
          ],
        ),
        body: MyCardList(),
      ),
    );
  }
}

class MyCardList extends StatelessWidget {
  final List<String> items = [
    'Nama : Reza Edi Saputra',
    'NIM : 202203040041',
    'Prodi : Sarjana Informatika',
    'Belajar Flutter',
    'Belajar Dart',
    'Belajar Laravel',
    'Membuat Aplikasi',
    'Aplikasi Pertama Flutter',
    'Memasak',
    'Makan',
    'Tidur',
    'Olahraga',
    // Bisa ditambahkan sendiri untuk list cardnya
  ];

  MyCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CustomCard(text: items[index]);
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;

  const CustomCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: ListTile(
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Kamu memilih: $text'),
            ));
          },
        ),
      ),
    );
  }
}
