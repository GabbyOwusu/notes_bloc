import 'package:flutter/material.dart';
import 'package:notes_bloc/models/note_model.dart';

class NoteCard extends StatelessWidget {
  final Function()? onTap;
  final NoteModel note;
  const NoteCard({
    super.key,
    required this.note,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    note.title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              note.body!,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.3,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Last Edited : today',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
