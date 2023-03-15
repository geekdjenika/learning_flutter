import 'package:flutter/material.dart';

class FAButton extends StatelessWidget {
  const FAButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width * .08,
            child: const Icon(
              Icons.accessible
            ),
          )
          /*Icon(
            Icons.add_reaction,
            //color: Colors.black,
          ),
          ToggleButtons(
            selectedColor: Colors.teal,
            selectedBorderColor: Colors.teal,
            disabledColor: Colors.black,
            disabledBorderColor: Colors.black,
            borderWidth: .8,
            isSelected: const [false,true],
            mouseCursor: MouseCursor.defer,
            children: const [Text("Submit"),Text("Cancel")],
          ),*/
        ],
      ),
    );
  }
}
