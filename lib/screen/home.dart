import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final Map<String, dynamic> _cours = {
    "Menu": "Intermédiaire",
    "GroupedList": "Débutant",
    "SQLite": "Débutant",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.floppy_disk),
        title: Center(
          child: Text(
            'learning',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * .055
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              CupertinoIcons.info_circle,
            ),
          )
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: ListView.builder(
        itemCount: _cours.keys.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.teal,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(CupertinoIcons.folder_open),
              ),
              title: Text(
                _cours.keys.toList()[index],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .055),
              ),
              subtitle: Text(
                _cours.values.toList()[index],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontSize: MediaQuery.of(context).size.width * .04),
              ),
              trailing: const Icon(
                CupertinoIcons.forward,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
