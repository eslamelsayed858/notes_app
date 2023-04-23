import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/simpl_bloc_odserver.dart';
import 'package:notes_app/views/notes_views.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'model/note_model.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(NotModelAdapter());
  await Hive.openBox<NotModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesViews(),
      ),
    );
  }
}
