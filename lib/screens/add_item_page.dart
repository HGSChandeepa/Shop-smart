import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  //validation checking kery
  final _formKey = GlobalKey<FormState>();
  //variables of the input item name and item count
  late String _itemName;
  late int _amount;

  //this is the function that is use to add a new item and also tis will add the data to the firestore

  void _addItem() async {
    //if the form is falid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await FirebaseFirestore.instance.collection("shoplist").add({
          'itemName': _itemName,
          'amount': _amount,
        });
        Navigator.pop(context);
        ;
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "enter the item name"),
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
              TextFormField(
                decoration: InputDecoration(hintText: "enter the item count"),
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
                  onPressed: () {
                    _addItem();
                  },
                  child: Text("Add Item"))
            ],
          ),
        ),
      ),
    );
  }
}
