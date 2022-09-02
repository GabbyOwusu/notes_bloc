import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes_event.dart';
import 'package:notes_bloc/bloc/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesLoading()) {
    on<AddNote>(_addNote);
    on<LoadNotes>(_loadNotes);
    on<UpdateNote>(_updateNotes);
    on<DeleteNote>(_deleteNote);
    on<SearchNotes>(_searchNotes);
  }

  void _loadNotes(LoadNotes event, Emitter<NotesState> emitter) {
    emitter(NotesLoaded(notes: event.notes));
  }

  void _searchNotes(SearchNotes event, Emitter<NotesState> emitter) {
    final state = this.state;
    if (state is NotesLoaded) {
      final notes = state.notes;

      final filtered = notes.where(
        (note) {
          return note.title!.toLowerCase().contains(event.query) ||
              note.body!.toLowerCase().contains(event.query);
        },
      ).toList();
      emitter(NotesLoaded(notes: filtered));
    }
  }

  void _addNote(AddNote event, Emitter<NotesState> emitter) {
    final state = this.state;
    if (state is NotesLoaded) {
      final notes = state.notes;
      notes.add(event.note);
      emitter(NotesLoaded(notes: notes));
    }
  }

  void _updateNotes(UpdateNote event, Emitter<NotesState> emitter) {
    final state = this.state;
    if (state is NotesLoaded) {
      final notes = state.notes;
      final index = notes.indexWhere((note) => note == event.currentNote);
      notes[index] = event.note;
      emitter(NotesLoaded(notes: notes));
    }
  }

  void _deleteNote(DeleteNote event, Emitter<NotesState> emitter) {
    final state = this.state;
    if (state is NotesLoaded) {
      final notes = state.notes;
      final index = notes.indexWhere((note) => note == event.note);
      notes.removeAt(index);
      emitter(NotesLoaded(notes: notes));
    }
  }
}
