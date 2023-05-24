import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  Hasil({
    super.key,
    required this.nama,
    required this.prodi,
    required this.fakultas,
    required this.keperluan,
  });

  String nama;
  String prodi;
  String fakultas;
  String keperluan;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Data Hasil"),
        ),
        body: Column(
          children: [
            Text("Nama : $nama"),
            Text("Prodi : $prodi"),
            Text("Fakultas : $fakultas"),
            Text("Keperluan : $keperluan")
          ],
        ),
      ),
    );
  }
}
