import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/services/database.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key, required this.uid});

  //uid
  final String uid;
  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  //validation checking kery
  final _formKey = GlobalKey<FormState>();
  //variables of the input item name and item count
  late String _itemName;
  late int _amount;
  DataBaseConfig firebaseService = DataBaseConfig(uid: '');

  //this is the function that is use to add a new item and also tis will add the data to the firestore

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //name feild for the item
              TextFormField(
                decoration:
                    const InputDecoration(hintText: "enter the item name"),
                //chcek the validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a item name";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _itemName = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              //amount feild for the item
              TextFormField(
                decoration:
                    const InputDecoration(hintText: "enter the item count"),
                //chcek the validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a item count";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _amount = int.parse(value);
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () async {
                    await firebaseService
                        .addItem(_itemName, _amount, widget.uid)
                        .then((value) => Navigator.pop(context));
                  },
                  child: const Text("Add Item"))
            ],
          ),
        ),
      ),
    );
  }
}
