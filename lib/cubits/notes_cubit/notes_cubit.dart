import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:notes_app/constants.dart';
import 'package:notes_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NotModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NotModel>(kNotesBox);

    notes = notesBox.values.toList();
    emit(NotesSuccSate());
  }
}
