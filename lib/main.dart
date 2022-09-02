import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes_bloc.dart';
import 'package:notes_bloc/bloc/notes_event.dart';
import 'package:notes_bloc/models/note_model.dart';
import 'package:notes_bloc/views/notes_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotesBloc()
            ..add(
              LoadNotes(
                notes: [
                  NoteModel(
                    title: "First note",
                    body: "Here is some note body",
                    createdAt: DateTime.now(),
                  ),
                  NoteModel(
                    title: "Second note",
                    body:
                        "Here is some note body,Here is some note body,Here is some note body",
                    createdAt: DateTime.now(),
                  ),
                  NoteModel(
                    title: "Third note",
                    body:
                        "Here is some note body,Here is some note body,Here is some note body",
                    createdAt: DateTime.now(),
                  ),
                  NoteModel(
                    title: "Fourth note",
                    body: "Here is some note body",
                    createdAt: DateTime.now(),
                  ),
                  NoteModel(
                    title: "Fifth note",
                    body: "Here is some note body",
                    createdAt: DateTime.now(),
                  ),
                ],
              ),
            ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const NotesListView(),
      ),
    );
  }
}
