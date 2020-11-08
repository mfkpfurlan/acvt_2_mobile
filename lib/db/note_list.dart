// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';

// import 'note.dart';
// import 'note_database_helper.dart';
// import 'notes_model.dart';

// class NoteList extends StatelessWidget {
//   // List<Note> noteList;
//   final List colorPriority = [Colors.red, Colors.blue, Colors.yellow];
//   final List iconPriority = [
//     Icons.arrow_forward,
//     Icons.arrow_right,
//     Icons.keyboard_arrow_right
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: ScopedModelDescendant<NotesModel>(
//         builder: (BuildContext inContext, Widget inChild, NotesModel inModel) {
//           return FloatingActionButton(
//             onPressed: () {
//               inModel.note = Note("", 1);
//               inModel.stackIndex = 1;
//             },
//             tooltip: "Nova anotação",
//             child: Icon(Icons.add),
//           );
//         },
//       ),
//       body: getNoteListView(),
//     );
//   }

//   Widget getNoteListView() {
//     return ScopedModelDescendant<NotesModel>(
//       builder: (inContext, inChild, NotesModel inModel) {
//         return ListView.builder(
//           itemCount: inModel.noteList.length,
//           itemBuilder: (context, position) {
//             return Card(
//               color: colorPriority[inModel.noteList[position].priority - 1],
//               elevation: 5,
//               child: ListTile(
//                 leading:
//                     Icon(iconPriority[inModel.noteList[position].priority - 1]),
//                 title: Text(inModel.noteList[position].title),
//                 subtitle: Text(inModel.noteList[position].description),
//                 onTap: () {
//                   //_meuProprioPush(context, inModel.noteList[position]);
//                   inModel.note = inModel.noteList[position];
//                   inModel.stackIndex = 1;
//                 },
//                 trailing: GestureDetector(
//                     onTap: () {
//                       _delete(context, inModel.noteList[position], inModel);
//                     },
//                     child: Icon(Icons.delete)),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   _delete(BuildContext context, Note note, NotesModel inModel) async {
//     int result = await DatabaseHelper.helper.deleteNote(note.id);
//     if (result != 0) {
//       Scaffold.of(context).showSnackBar(
//           SnackBar(content: Text("Anotação apagada com sucesso!")));
//     }
//     inModel.loadData();
//   }
// }
