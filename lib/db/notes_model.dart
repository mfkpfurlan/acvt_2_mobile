// import 'package:scoped_model/scoped_model.dart';
// import 'note.dart';
// import 'note_database_helper.dart';

// class NotesModel extends Model {
//   int _stackIndex = 0;
//   List noteList = [];
//   Note _note = Note("", 1);

//   get stackIndex => _stackIndex;
//   set stackIndex(int newStackIndex) {
//     _stackIndex = newStackIndex;
//     notifyListeners();
//   }

//   get note => _note;
//   set note(Note newNote) {
//     _note = newNote;
//     notifyListeners();
//   }

//   get priority => _note.priority;
//   set priority(int newPriority) {
//     _note.priority = newPriority;
//     notifyListeners();
//   }

//   loadData() async {
//     noteList = await DatabaseHelper.helper.getNoteList();
//     notifyListeners();
//   }
// }
