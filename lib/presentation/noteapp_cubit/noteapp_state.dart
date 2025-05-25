part of 'noteapp_cubit.dart';

@immutable
sealed class NoteappState {}

final class NoteappInitial extends NoteappState {}
final class successNoteapp extends NoteappState {}
