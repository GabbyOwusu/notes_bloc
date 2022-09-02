import 'package:equatable/equatable.dart';
import 'package:notes_bloc/models/note_model.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotes extends NotesEvent {
  final List<NoteModel> notes;

  const LoadNotes({this.notes = const <NoteModel>[]});

  @override
  List<Object?> get props => [notes];
}

class AddNote extends NotesEvent {
  final NoteModel note;

  const AddNote({required this.note});

  @override
  List<Object?> get props => [note];
}

class DeleteNote extends NotesEvent {
  final NoteModel note;

  const DeleteNote({required this.note});

  @override
  List<Object?> get props => [note];
}

class UpdateNote extends NotesEvent {
  final NoteModel note;
  final NoteModel currentNote;

  const UpdateNote({required this.note, required this.currentNote});

  @override
  List<Object?> get props => [note];
}
