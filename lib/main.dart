import 'package:flutter/material.dart';
import 'package:pertemuan4/Dropdown.dart';
import 'package:pertemuan4/Input.dart';
import 'package:pertemuan4/Konversi.dart';
import 'package:pertemuan4/Result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _result = 0;

  String _selectedDropdown = "Pilih Suhu";
  final _listSatuanSuhu = ["Silahkan Pilih Suhu", "Kelvin", "Reamur"];
  List<String> _listHasil = [];
  TextEditingController etInput = TextEditingController();

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
    _convertHandler();
  }

  _convertHandler() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "Kelvin":
            _result = _inputUser + 273;
            _listHasil.add("Konversi dari:  $_inputUser ke  $_result Kelvin");
            break;
          case "Reamur":
            _result = _inputUser * 4 / 5;
            _listHasil.add("Konversi dari:  $_inputUser ke  $_result Reamur");
            break;
          default:
            _listHasil.add("Suhu belum dipilih");
            break;
        }
      } else {
        _listHasil.add("Suhu belum dipilih dan Celcius kosong");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobsheet 5',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangedDropdown),
              Konversi(convertHandler: _convertHandler),
              Result(listHasil: _listHasil)
            ],
          ),
        ),
      ),
    );
  }
}
