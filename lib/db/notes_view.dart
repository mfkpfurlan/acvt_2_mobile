// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';

// import 'note_list.dart';
// import 'notes_entry.dart';
// import 'notes_model.dart';

// class NotesView extends StatelessWidget {
//   final NotesModel notesModel = new NotesModel();

//   NotesView() {
//     notesModel.loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel<NotesModel>(
//         model: notesModel,
//         child: ScopedModelDescendant<NotesModel>(builder:
//             (BuildContext inContext, Widget inChild, NotesModel inModel) {
//           return IndexedStack(
//             index: inModel.stackIndex,
//             children: [NoteList(), NotesEntry()],
//           );
//         }));
//   }
// }
