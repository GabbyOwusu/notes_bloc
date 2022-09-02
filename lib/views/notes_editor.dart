import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes_bloc.dart';
import 'package:notes_bloc/bloc/notes_event.dart';
import 'package:notes_bloc/bloc/notes_state.dart';
import 'package:notes_bloc/models/note_model.dart';

class NotesEditor extends StatefulWidget {
  final NoteModel? currentNote;
  const NotesEditor({super.key, this.currentNote});

  @override
  State<NotesEditor> createState() => _NotesEditorState();
}

class _NotesEditorState extends State<NotesEditor> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.currentNote != null) {
      titleController.text = widget.currentNote?.title ?? "";
      bodyController.text = widget.currentNote?.body ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NotesBloc>();
    return BlocListener<NotesBloc, NotesState>(
      listener: (ctx, state) {
        if (state is NotesLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New note added'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              TextField(
                controller: titleController,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Theme.of(context).primaryColor,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 19,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
              TextField(
                enableInteractiveSelection: true,
                controller: bodyController,
                style: const TextStyle(fontSize: 15),
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  hintText: 'Type here',
                  hintStyle: TextStyle(
                    fontSize: 19,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Date time',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final note = NoteModel(
              title: titleController.text,
              body: bodyController.text,
              createdAt: DateTime.now(),
            );
            if (widget.currentNote != null) {
              bloc.add(
                UpdateNote(
                  currentNote: widget.currentNote!,
                  note: note,
                ),
              );
            } else {
              context.read<NotesBloc>().add(
                    AddNote(
                      note: NoteModel(
                        title: titleController.text,
                        body: bodyController.text,
                        createdAt: DateTime.now(),
                      ),
                    ),
                  );
            }
            Navigator.pop(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
