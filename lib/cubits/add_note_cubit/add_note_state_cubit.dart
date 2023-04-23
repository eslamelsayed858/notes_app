import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:notes_app/constants.dart';
import 'package:notes_app/model/note_model.dart';

part 'add_note_state_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xff1EB4EB);

  addNote(NotModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
