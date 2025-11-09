// lib/ui/produk_form.dart

import 'package:flutter/material.dart'; // [cite: 730]
import 'package:ambatukam/ui/produk_detail.dart';

class ProdukForm extends StatefulWidget { // [cite: 732]
  const ProdukForm({Key? key}): super(key: key);
  @override
  ProdukFormState createState() => ProdukFormState(); // [cite: 734]
}

class ProdukFormState extends State<ProdukForm> { // [cite: 735]
  final _kodeProdukController = TextEditingController(); // [cite: 736]
  final _namaProdukController = TextEditingController(); // [cite: 737]
  final _hargaProdukController = TextEditingController(); // [cite: 737]

  @override
  Widget build (BuildContext context) { // [cite: 738]
    return Scaffold( // [cite: 772]
      appBar: AppBar( // [cite: 773]
        title: const Text('Form Produk'), // [cite: 774]
      ),
      body: Container( // [cite: 776]
        margin: EdgeInsets.all(10), // [cite: 777]
        child: Column( // [cite: 778]
          children: [
            _textboxKodeProduk(), // [cite: 781]
            _textboxNamaProduk(), // [cite: 782]
            _textboxHarga(), // [cite: 783]
            _tombolSimpan() // [cite: 784]
          ],
        ),
      ),
    );
  }

  _textboxKodeProduk() { // [cite: 792]
    return TextField( // [cite: 793]
      decoration: const InputDecoration (labelText: "Kode Produk"), // [cite: 794]
      controller: _kodeProdukController, // [cite: 795]
    );
  }

  _textboxNamaProduk() { // [cite: 805]
    return TextField( // [cite: 806]
      decoration: const InputDecoration (labelText: "Nama Produk"), // [cite: 807]
      controller: _namaProdukController,
    );
  }

  _textboxHarga() { // [cite: 816]
    return TextField( // [cite: 817]
      decoration: const InputDecoration (labelText: "Harga"), // [cite: 818]
      controller: _hargaProdukController,
      keyboardType: TextInputType.number, // Ditambahkan agar keyboard numerik muncul
    );
  }

  _tombolSimpan() { // [cite: 833, 784]
    return ElevatedButton ( // [cite: 826]
      onPressed: () { // [cite: 834]
        String kodeProduk = _kodeProdukController.text; // [cite: 835]
        String namaProduk = _namaProdukController.text; // [cite: 835]
        int harga = int.parse(_hargaProdukController.text); // [cite: 835]
        
        Navigator.of (context).push(MaterialPageRoute( // [cite: 835]
          builder: (context) => ProdukDetail( // [cite: 836]
            kodeProduk: kodeProduk, // [cite: 840, 841]
            namaProduk: namaProduk, // [cite: 842, 843]
            hargaProduk: harga, // [cite: 844]
          )
        ));
      },
      child: const Text('Simpan'), // [cite: 850]
    );
  }
}