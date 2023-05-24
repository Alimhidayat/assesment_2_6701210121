import 'package:assesment_2_6701210121/hasil.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// Class Radio

enum JenisKendaraan { avanza_xenia, elf }

enum DurasiPeminjaman { duabelas, lapanbelas }

class _MainPageState extends State<MainPage> {
  // final _formKey = GlobalKey<FormState>();
  /// mengambil nilai
  final _namaController = TextEditingController();
  final _prodiController = TextEditingController();
  final _fakultasController = TextEditingController();
  final _keperluanController = TextEditingController();

  final _kendaraan = TextEditingController();
  final _durasi = TextEditingController();

  // Nilai pada radio button
  var kendaraan1 = "Avanza/Xenia";
  var kendaraan2 = "Elf";

  // Nilai pada radio button
  var durasi1 = "12 jam";
  var durasi2 = "18 jam";

  JenisKendaraan? _character = JenisKendaraan.avanza_xenia;

  DurasiPeminjaman? _value = DurasiPeminjaman.duabelas;

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // Checkbox
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Assesment 2 6701210121"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // child: Text("Nama"),
                controller: _namaController,
                decoration: InputDecoration(
                  hintText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _prodiController,
                      decoration: InputDecoration(
                        hintText: "Prodi",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _fakultasController,
                      decoration: InputDecoration(
                        hintText: "Fakultas",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _keperluanController,
                decoration: InputDecoration(
                  hintText: "Keperluan Peminjaman Kendaraan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text("Jenis Kendaraan"),
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Avanza/Xenia'),
                    leading: Radio<JenisKendaraan>(
                      value: JenisKendaraan.avanza_xenia,
                      groupValue: _character,
                      onChanged: (JenisKendaraan? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Elf'),
                    leading: Radio<JenisKendaraan>(
                      value: JenisKendaraan.elf,
                      groupValue: _character,
                      onChanged: (JenisKendaraan? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text("Durasi Peminjaman Kendaraan"),
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('12 Jam'),
                    leading: Radio<DurasiPeminjaman>(
                      value: DurasiPeminjaman.duabelas,
                      groupValue: _value,
                      onChanged: (DurasiPeminjaman? value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('18 Jam'),
                    leading: Radio<DurasiPeminjaman>(
                      value: DurasiPeminjaman.lapanbelas,
                      groupValue: _value,
                      onChanged: (DurasiPeminjaman? value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  Text("Dengan Supir")
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return Hasil(
                          nama: _namaController.text,
                          prodi: _prodiController.text,
                          fakultas: _fakultasController.text,
                          keperluan: _keperluanController.text,
                        );
                      }),
                    ),
                  );
                },
                child: Text("Kirim Permintaan"),
              )
            ],
          )
        ],
      ),
    );
  }
}
