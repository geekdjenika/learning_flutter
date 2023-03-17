import 'package:flutter/material.dart';

class FAButton extends StatelessWidget {
  const FAButton({Key? key}) : super(key: key);

  //bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.brown,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /** i sClicked = !isClicked; */
        },
        tooltip: 'Changer',
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Icon(Icons.save_alt),
      ),
    );
  }
}
