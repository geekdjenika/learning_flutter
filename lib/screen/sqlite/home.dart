import 'package:flutter/material.dart';
import 'package:tools/services/sqlite/sql_helper.dart';

class CRUDSQLite extends StatefulWidget {
  const CRUDSQLite({Key? key}) : super(key: key);

  @override
  State<CRUDSQLite> createState() => _CRUDSQLiteState();
}

class _CRUDSQLiteState extends State<CRUDSQLite> {
  List<Map<String, dynamic>> _journals = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _refreshJournals();
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id,_titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Supprimer avec succès !'))
    );
    _refreshJournals();
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Titre'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      id == null ? _addItem() : _updateItem(id);
                      _titleController.text = '';
                      _descriptionController.text = '';
                      Navigator.pop(context);
                    },
                    child: Text(id == null ? 'Ajouter' : 'Modifier'),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showForm(null);
        },
        child: Icon(Icons.edit_note_rounded),
      ),
      body: ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Text("${_journals[index]['title'].toString().substring(0,1).toUpperCase()}"),
            ),
            title: Text('${_journals[index]['title']}'),
            subtitle: Text('${_journals[index]['description']}'),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * .125,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showForm(_journals[index]['id']);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _deleteItem(_journals[index]['id']);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
