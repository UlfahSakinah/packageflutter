import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './province.dart';
import './city.dart';

class HomePage extends StatelessWidget {
  String? idProv;

  final String apiKey =
      "8e0f26e16b9434acaa56a1e7ab47468853c8af81e72fddd55d876c482d0a88";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WILAYAH INDONESIA"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            onChanged: (value) => idProv = value?.id,
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Belum memilih provinsi"),
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));
              if (response.statusCode != 200) {
                return [];
              }

              List allProvince =
                  (json.decode(response.body) as Map<String, dynamic>)['value'];
              List<Province> allModelProvince = [];

              allProvince.forEach((element) {
                allModelProvince.add(
                  Province(
                    id: element["id"],
                    name: element["name"],
                  ),
                );
              });
              return allModelProvince;
            },
          ),
          SizedBox(height: 20),
          DropdownSearch<City>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            onChanged: (value) => print(value?.toString()),
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Belum memilih kota/kabupaten"),
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            onFind: (text) async {
              print("CHECK ID PROVINSI");
              print(idProv);

              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"));
              if (response.statusCode != 200) {
                return [];
              }

              List allCity =
                  (json.decode(response.body) as Map<String, dynamic>)['value'];
              List<City> allModelCity = [];

              allCity.forEach((element) {
                allModelCity.add(
                  City(
                    id: element["id"],
                    idProvinsi: element["id_provinsi"],
                    name: element["name"],
                  ),
                );
              });
              return allModelCity;
            },
          ),
        ],
      ),
    );
  }
}
