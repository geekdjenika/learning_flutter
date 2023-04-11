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

  final _myForm = GlobalKey<FormState>();
  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _refreshJournals();
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text.trimLeft(), _descriptionController.text);
    _refreshJournals();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Supprimer avec succès !')));
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
              decoration: const BoxDecoration(
                  //color: Colors.cyan,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Form(
                key: _myForm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Titre'),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Le titre ne doit pas être vide !";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "Donner une description d'au moins 4 caractères !";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_myForm.currentState!.validate()) {
                          id == null ? _addItem() : _updateItem(id);
                          _titleController.text = '';
                          _descriptionController.text = '';
                          Navigator.pop(context);
                        }
                      },
                      child: Text(id == null ? 'Ajouter' : 'Modifier'),
                    )
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showForm(null);
        },
        child: const Icon(Icons.edit_note_rounded),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                elevation: 2,
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(_journals[index]['title']
                        .toString()
                        .substring(0, 1)
                        .toUpperCase()),
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
                          child: const Icon(
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
