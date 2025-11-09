import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int umur = 0;
    final int tahunLahirInt = int.tryParse(tahunLahir) ?? DateTime.now().year;
    
    if (tahunLahirInt > 1900 && tahunLahirInt <= DateTime.now().year) {
      umur = DateTime.now().year - tahunLahirInt;
    }

    final String teksOutput = 
        "Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            teksOutput,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}