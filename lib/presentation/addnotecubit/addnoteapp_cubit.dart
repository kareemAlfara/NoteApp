import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/services/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/models/noteModel.dart';

part 'addnoteapp_state.dart';

class addNoteappCubit extends Cubit<addNoteappState> {
  addNoteappCubit() : super(addNoteappInitial());
  static addNoteappCubit get(context) => BlocProvider.of(context);
  bool isloading = false;
  var formkey = GlobalKey<FormState>();
  var titlecontroll = TextEditingController();
  var Contentcontroll = TextEditingController();
  Color color = Color(0xffBBDB9B);
  addNoteapp(Notemodel note) async {
    try {
      note.color = color.value;
      emit(addNoteapploading());
      note.color = color.value;
      var notebox = Hive.box<Notemodel>(Notebox);
      await notebox.add(note);
      emit(addNoteappSuccess());
    } catch (e) {
      print(e.toString());
      emit(addNoteappfailure(Error: e.toString()));
    }
  }
}
