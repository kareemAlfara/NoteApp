import 'package:flutter/material.dart';
import 'package:note_app/services/components.dart';
import 'package:note_app/domain/entites/models/noteModel.dart';
import 'package:note_app/presentation/noteapp_cubit/noteapp_cubit.dart';

class EditingNote extends StatefulWidget {
  const EditingNote({super.key, required this.model});
  final Notemodel model;
  @override
  State<EditingNote> createState() => _EditingNoteState();
}

class _EditingNoteState extends State<EditingNote> {
  @override
  void initState() {
    titlecontroll.text = widget.model.title;
    contentcontroll.text = widget.model.Subtitle;

    super.initState();
  }

  var titlecontroll = TextEditingController();
  var contentcontroll = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noteAppbar(
        text: "Editing Note",
        icon: Icons.check,
        onPressed: () {
          widget.model.title = title ?? widget.model.title;
          widget.model.Subtitle = content ?? widget.model.Subtitle;
          widget.model.save();
          NoteappCubit.get(context).fetchNotes();
          Navigator.pop(context);
          if (formkey.currentState!.validate()) {}
        },
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 55),
              defulitTextFormField(
              maxline: 2,
                label:const Text("Title"),
                onChanged: (value) {
                  title = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a title";
                  }
                  return null;
                },

                textInputAction: TextInputAction.next,
                controller: titlecontroll,
              ),
const              SizedBox(height: 22),

              defulitTextFormField(
              maxline: 2,
                label:const Text("Content"),

                onChanged: (value) {
                  content = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a content";
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                controller: contentcontroll,
              ),

              // Spacer(),
          const    SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
