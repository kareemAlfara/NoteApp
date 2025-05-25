part of 'addnoteapp_cubit.dart';

@immutable
sealed class addNoteappState {}

final class addNoteappInitial extends addNoteappState {}

final class addNoteapploading extends addNoteappState {}

final class addNoteappSuccess extends addNoteappState {}

final class addNoteappfailure extends addNoteappState {
  final String Error;

  addNoteappfailure({required this.Error});
}
