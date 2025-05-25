import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/services/components.dart';
import 'package:note_app/domain/entites/models/noteModel.dart';

part 'noteapp_state.dart';

class NoteappCubit extends Cubit<NoteappState> {
  NoteappCubit() : super(NoteappInitial());
static  NoteappCubit get(context) => BlocProvider.of(context);
  List<Notemodel>? notelist;
  fetchNotes()async {
    var notebox = Hive.box<Notemodel>(Notebox);
  notelist=  notebox.values.toList();
    emit(successNoteapp());
  }
}
