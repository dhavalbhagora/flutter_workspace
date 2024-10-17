import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> dataList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://prakrutitech.buzz/Dhaval/selectproduct.php'));

    if (response.statusCode == 200) {
      // Decode the JSON response
      setState(() {
        dataList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mobile List')),
      body: dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey, Colors.purple],
                        ),
                      ),
                      child: ListTile(
                        title: Text(dataList[index]
                            ['product_name']), // Customize as per your data
                        subtitle: Wrap(
                          children: [
                            Text(
                                'Details: ${dataList[index]['product_description']}'),
                            Text(
                                '  Price: ${dataList[index]['product_price']}'),
                          ],
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                editbox(index);
                                setState(() {
                                  fetchData();
                                });
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                              onPressed: () {
                                deletecom(dataList[index]['id']);
                                setState(() {
                                  fetchData();
                                });
                              },
                              icon: Icon(Icons.delete),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addproduct();
          setState(() {
            fetchData();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addproduct() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.purple],
            ),
          ),
          child: AlertDialog(
            title: Text("Add Product"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Product Description'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); //
                  setState(() {
                    fetchData();
                  }); // Close dialog
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  _addProduct(
                    nameController.text,
                    priceController.text,
                    descriptionController.text,
                  );
                  nameController.clear();
                  priceController.clear();
                  descriptionController.clear();
                  Navigator.of(context).pop(); // Close dialog after adding
                  setState(() {
                    fetchData();
                  });
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _addProduct(
      String name, String price, String description) async {
    String url = 'https://prakrutitech.buzz/Dhaval/addproduct.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'product_name': name,
        'product_price': price,
        'product_description': description,
      },
    );
    setState(() {
      fetchData();
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ' + data['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Server error')),
      );
    }
  }

  void deletecom(String index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.purple],
            ),
          ),
          child: AlertDialog(
            title: Text("Confirm Deletion"),
            content: Text("Are you sure you want to delete?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  _deleteProduct(index);
                  Navigator.of(context).pop();
                  // Close dialog after deletion
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteProduct(String index) async {
    String url = 'https://prakrutitech.buzz/Dhaval/delete_product.php';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'id': index // Send product id to the server
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted')),
    );
  }

  void editbox(int index) {
    TextEditingController nameController =
        TextEditingController(text: dataList[index]['product_name']);
    TextEditingController priceController =
        TextEditingController(text: dataList[index]['product_price']);
    TextEditingController descriptionController =
        TextEditingController(text: dataList[index]['product_description']);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Colors.purple],
            ),
          ),
          child: AlertDialog(
            title: Text("Edit Product"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Product Description'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  _updateProduct(
                    dataList[index]['id'], // Product ID
                    nameController.text,
                    priceController.text,
                    descriptionController.text,
                    index,
                  );

                  Navigator.of(context).pop(); // Close dialog after updating
                  setState(() {
                    fetchData();
                  });
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updateProduct(String id, String name, String price,
      String description, int index) async {
    String url = 'https://prakrutitech.buzz/Dhaval/update_product.php';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'id': id,
        'product_name': name,
        'product_price': price,
        'product_description': description,
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data Updated')),
    );
    setState(() {
      fetchData();
    });
  }
}
