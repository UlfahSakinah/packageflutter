import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Map<String, dynamic>> dataList = [
    {
      "country": "Brazil",
      "id": 1,
    },
    {
      "country": "Tunisia",
      "id": 2,
    },
    {
      "country": "Canada",
      "id": 3,
    },
    {
      "country": "India",
      "id": 4,
    },
    {
      "country": "Indonesia",
      "id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DROPDOWN"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          mode: Mode.BOTTOM_SHEET,
          items: dataList,
          onChanged: (value) => print(value?["id"] ?? null),
          selectedItem: {
            "country": "Canada",
            "id": 3,
          },
          showClearButton: true,
          showSearchBox: true,
          popupItemBuilder: (context, item, inSelected) => ListTile(
            textColor: Colors.red,
            title: Text(item["country"].toString()),
          ),
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?["country"].toString() ?? "Belum pilih negara"),
        ),
      ),
    );
  }
}
