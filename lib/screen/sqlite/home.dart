import 'package:flutter/material.dart';
import 'package:tools/services/sqlite/sql_helper.dart';

class CRUDSQLite extends StatefulWidget {
  const CRUDSQLite({Key? key}) : super(key: key);

  @override
  State<CRUDSQLite> createState() => _CRUDSQLiteState();
}

class _CRUDSQLiteState extends State<CRUDSQLite> {

  List<Map<String, dynamic>> _journals = [];

  void _refreshJurnals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _refreshJurnals();
  }

  void showForm(int? id) async {
    if(id == null) {
      showModalBottomSheet(context: context, builder: (_) => Card(

      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(
          Icons.edit_note_rounded
        ),
      ),
    );
  }
}
