import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  final List<String> _names = [];
  final TextEditingController _textController = TextEditingController();
  int? _editIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Edit Update Delete'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _textController.clear(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded border
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded border
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded border
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: _addOrEditName,
                child: Text(
                  _editIndex != null ? 'Edit Name' : 'Add Name',
                  style: TextStyle(),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white)),
            SizedBox(height: 16),
            Expanded(
              // ListView to display the names
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_names[index]),
                    onTap: () => _showDialog(_names[index]), // Single tap
                    onLongPress: () =>
                        _showContextMenu(context, index), // Long press
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to add or edit name
  void _addOrEditName() {
    final String enteredText = _textController.text.trim();

    if (enteredText.isEmpty) return;

    setState(() {
      if (_editIndex != null) {
        _names[_editIndex!] = enteredText;
        _editIndex = null;
      } else {
        _names.add(enteredText);
      }
    });

    _textController.clear();
  }

  void _showDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name'),
          content: Text(name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, int index) async {
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100), // arbitrary position
      items: [
        PopupMenuItem<String>(value: 'edit', child: Text('Edit Item')),
        PopupMenuItem<String>(value: 'delete', child: Text('Delete Item')),
        PopupMenuItem<String>(value: 'exit', child: Text('Exit')),
      ],
    );

    if (result == 'delete') {
      _confirmDeleteItem(index);
    } else if (result == 'edit') {
      _editItem(index);
    } else if (result == 'exit') {
      Navigator.of(context).pop();
    }
  }

  void _confirmDeleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _names.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(int index) {
    setState(() {
      _textController.text = _names[index];
      _editIndex = index;
    });
  }
}
