import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FAKER"),
        ),
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/id/${879 + index}/200/300"),
                  ),
                  title: Text("${faker.person.name()}"),
                  subtitle: Text("${faker.internet.email()}"),
                )));
  }
}
