// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  String? title;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;

  NoteModel({
    this.title,
    this.updatedAt,
    this.createdAt,
    this.body,
  });

  @override
  List<Object?> get props => [
        title,
        updatedAt,
        createdAt,
        body,
      ];

  static List<NoteModel> notesList = [
    NoteModel(
      title: "First note",
      body: "Here is some note body",
      createdAt: DateTime.now(),
    ),
    NoteModel(
      title: "First note",
      body: "Here is some note body",
      createdAt: DateTime.now(),
    ),
    NoteModel(
      title: "First note",
      body: "Here is some note body",
      createdAt: DateTime.now(),
    ),
  ];
}
