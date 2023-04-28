import 'package:flutter/material.dart';
import 'package:shop_list/screens/add_item_page.dart';

class AllItemsPage extends StatelessWidget {
  const AllItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
      ),
      body: Text("hello"),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddNewItem(),
                ));
          },
          child: Icon(Icons.add)),
    );
  }
}
