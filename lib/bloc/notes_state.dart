import 'package:equatable/equatable.dart';
import 'package:notes_bloc/models/note_model.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object?> get props => [];
}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  const NotesLoaded({this.notes = const <NoteModel>[]});
  final List<NoteModel> notes;

  @override
  List<Object?> get props => [notes];
}
