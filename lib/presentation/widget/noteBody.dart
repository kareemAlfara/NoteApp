import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/services/components.dart';
import 'package:note_app/domain/usecases/editing.dart';
import 'package:note_app/domain/entites/models/noteModel.dart';
import 'package:note_app/presentation/noteapp_cubit/noteapp_cubit.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key, required this.model});
  final Notemodel model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteappCubit, NoteappState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => navigat(context, widget: EditingNote(model: model,)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, bottom: 11),
                child: Container(
                  decoration: BoxDecoration(
                    color:Color(model.color!),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        ListTile(
                          title: defulttext(
                            data: model.title,
                            color: Colors.black,
                            fSize: 27,
                          
                          ),
                          subtitle: defulttext(
                            data: model.Subtitle,
                            color: Colors.black54,
                            fSize: 20,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              model.delete();
                              NoteappCubit.get(context).fetchNotes();
                            },
                            icon:const Icon(Icons.delete),

                            iconSize: 50,
                            color: Colors.black,
                          ),
                        ),
                  const      SizedBox(height: 11),
                        defulttext(
                          data: model.Date,
                          color: Colors.black,
                          fSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
