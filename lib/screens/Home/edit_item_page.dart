import 'package:flutter/material.dart';

import 'package:shop_list/services/database.dart';

// ignore: must_be_immutable
class EditItemPage extends StatefulWidget {
  final String docId;
  late String itemName;
  late int amount;

  EditItemPage(
      {super.key,
      required this.docId,
      required this.itemName,
      required this.amount});

  @override
  // ignore: library_private_types_in_public_api
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DataBaseConfig firebaseService = DataBaseConfig(uid: '');

  @override
  void initState() {
    super.initState();
    itemNameController.text = widget.itemName;
    amountController.text = widget.amount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Item")),
      body: ListView(
        children: [
          TextField(
            controller: itemNameController,
            decoration: const InputDecoration(labelText: "Item Name"),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: "Amount"),
          ),
          ElevatedButton(
            child: const Text("Save"),
            onPressed: () async {
              await firebaseService
                  .updateItem(
                    widget.docId,
                    itemNameController.text,
                    int.parse(amountController.text),
                  )
                  .then((value) => Navigator.pop(context));
            },
          ),
          ElevatedButton(
            onPressed: () async {
              await firebaseService
                  .deleteItem(widget.docId)
                  .then((value) => Navigator.pop(context));
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
