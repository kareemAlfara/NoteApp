import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/presentation/screens/NoteApp.dart';
import 'package:note_app/presentation/screens/SimpleBlocObservier.dart';
import 'package:note_app/services/components.dart';
import 'package:note_app/data/models/noteModel.dart';
import 'package:note_app/presentation/noteapp_cubit/noteapp_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter((NotemodelAdapter()));
  await Hive.openBox<Notemodel>(Notebox);
  Bloc.observer = Simpleblocobservier();
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NoteappCubit()..fetchNotes()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const Noteapp(),
      ),
    );
  }
}
