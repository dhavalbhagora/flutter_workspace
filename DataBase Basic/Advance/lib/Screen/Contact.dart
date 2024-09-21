import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../db/db.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  MyDbHelper myDbHelper = MyDbHelper.instance;
  List<Map<String, dynamic>> allCategoryData = [];
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: allCategoryData.length,
                itemBuilder: (context, index) {
                  var item = allCategoryData[index];
                  Uint8List bytes = base64Decode(item['profile']);
                  return Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("${item['name']}  ${item['lname']}"),
                          leading: CircleAvatar(
                            child: Image.memory(
                              bytes,
                              fit: BoxFit.cover,
                            ),
                            minRadius: 20,
                            maxRadius: 30,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                _delete(item['_id']);
                              },
                              icon: Icon(Icons.delete)),
                          subtitle: Text(
                              "${item['email']} \nCategory:${item['cat']} \nMobile :${item['mobile']} "),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        )
                      ],
                    ),
                  );
                }))
      ]),
    );
  }

  void _query() async {
    final allRows = await myDbHelper.queryAllRowscontact();
    print('query all rows:');
    allRows.forEach(print);
    allCategoryData = allRows;
    setState(() {});
  }

  void _delete(int id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await myDbHelper.deleteContact(id);
    print('deleted $rowsDeleted row(s): row $id');
    _query();
  }
}
