import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/models/userdata.dart';
import 'package:shop_list/screens/Home/add_item_page.dart';
import 'package:shop_list/screens/Home/edit_item_page.dart';

class AllItemsPage extends StatefulWidget {
  const AllItemsPage({Key? key, required currentUser}) : super(key: key);

  @override
  State<AllItemsPage> createState() => _AllItemsPageState();
}

class _AllItemsPageState extends State<AllItemsPage> {
  @override
  Widget build(BuildContext context) {
    // Get the current user's UID from the provider
    final user = Provider.of<UserData?>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('shoplist')
            .where('uid', isEqualTo: user?.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error:${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['itemName']),
                subtitle: Text("Amount: ${data['amount']}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => EditItemPage(
                        docId: document.id,
                        itemName: data['itemName'],
                        amount: data['amount'],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddNewItem(uid: user!.uid),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
