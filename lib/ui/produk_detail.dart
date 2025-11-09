// lib/ui/produk_detail.dart

import 'package:flutter/material.dart'; // [cite: 862]

class ProdukDetail extends StatelessWidget { // [cite: 865]
  final String kodeProduk; // [cite: 887]
  final String namaProduk; // [cite: 888]
  final int hargaProduk; // [cite: 889]

  const ProdukDetail({ // [cite: 890]
    Key? key,
    required this.kodeProduk, // [cite: 892]
    required this.namaProduk, // [cite: 893]
    required this.hargaProduk // [cite: 894]
  }) : super(key: key);

  @override
  Widget build (BuildContext context) { // [cite: 897]
    return Scaffold( // [cite: 898]
      appBar: AppBar ( // [cite: 899]
        title: const Text("Detail Produk"), // [cite: 900]
      ),
      body: Container( // [cite: 902]
        margin: EdgeInsets.all(10), // [cite: 903]
        child: Column ( // [cite: 904]
          crossAxisAlignment: CrossAxisAlignment.start, // Ditambahkan agar rapi
          children: [ // [cite: 905]
            Text("Kode Produk: $kodeProduk"), // [cite: 906]
            Text("Nama Produk: $namaProduk"), // [cite: 912, 913]
            Text("Harga Produk: $hargaProduk") // [cite: 914, 915]
          ],
        ),
      ),
    );
  }
}