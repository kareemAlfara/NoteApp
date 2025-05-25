import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/presentation/widget/noteBody.dart';
import 'package:note_app/presentation/noteapp_cubit/noteapp_cubit.dart';

class Note_listView extends StatelessWidget {
  const Note_listView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NoteappCubit, NoteappState>(
      builder: (context, state) {
    var    cubit=NoteappCubit.get(context);
        return ListView.builder(
          itemBuilder: (context, index) => NoteBody(model:cubit.notelist![index] ,),
          itemCount: cubit.notelist!.length,
    
        );
      },
    );
  }
}
