import 'package:flutter/material.dart';

import 'package:note_app/presentation/widget/bottomsheet.dart';
import 'package:note_app/services/components.dart';
import 'package:note_app/presentation/widget/note_listView.dart';


class Noteapp extends StatelessWidget {
  const Noteapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: noteAppbar(
            text: "NOTES APP",
            icon: Icons.search,
            onPressed: () {},
          ),
          body: Note_listView(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
    
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => bottomSheet(),
              );
            },
            child: Icon(Icons.add),
          ),
        );
  }
}
