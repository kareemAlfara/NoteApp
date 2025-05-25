import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/addnotecubit/addnoteapp_cubit.dart';
import 'package:note_app/domain/usecases/AddNoteform.dart';
import 'package:note_app/presentation/noteapp_cubit/noteapp_cubit.dart';

class bottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addNoteappCubit(),
      child: BlocConsumer<addNoteappCubit, addNoteappState>(
        builder: (context, state) {
          var cubit = addNoteappCubit.get(context);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                right: 11,
                left: 11,
                top: 11,

                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddNoteform(cubit: cubit),
            ),
          );
        },
        listener: (BuildContext context, addNoteappState state) {
          if (state is addNoteapploading) {
            addNoteappCubit.get(context).isloading = true;
          } else if (state is addNoteappSuccess) {
            NoteappCubit.get(context).fetchNotes();
            Navigator.pop(context);
          }
          else  if (state is addNoteappfailure) {
            // ignore: avoid_print
            print("failed ${state.Error.toString()}");
          }
        },
      ),
    );
  }
}
