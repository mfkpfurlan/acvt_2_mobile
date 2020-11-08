// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';

// import 'note_database_helper.dart';
// import 'notes_model.dart';

// class NotesEntry extends StatelessWidget {
//   final GlobalKey<FormState> formKey = new GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return ScopedModelDescendant<NotesModel>(
//       builder: (inContext, inChild, NotesModel inModel) {
//         return WillPopScope(
//           onWillPop: () {
//             //print("Cliquei no botão voltar do dispositivo");
//             //Navigator.pop(context);
//             //return null;
//             inModel.stackIndex = 0;
//           },
//           child: Scaffold(
//               body: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   elevation: 5,
//                   child: Row(
//                     children: [
//                       getRadioButton(1, "Baixa", inModel),
//                       getRadioButton(2, "Média", inModel),
//                       getRadioButton(3, "Alta", inModel),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Focus(
//                     onFocusChange: (hasFocus) {
//                       if (!hasFocus) {
//                         formKey.currentState.save();
//                       }
//                     },
//                     child: TextFormField(
//                       initialValue: inModel.note.title,
//                       decoration: InputDecoration(
//                           labelText: "Título",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                       validator: (value) {
//                         if (value.length == 0) {
//                           return "Adicione algum título";
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         inModel.note.title = value;
//                       },
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     initialValue: inModel.note.description,
//                     decoration: InputDecoration(
//                         labelText: "Anotação",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     validator: (value) {
//                       if (value.length == 0) {
//                         return "Adicione alguma anotação";
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       inModel.note.description = value;
//                     },
//                   ),
//                 ),
//                 RaisedButton(
//                   child: Text("Save"),
//                   onPressed: () {
//                     if (formKey.currentState.validate()) {
//                       formKey.currentState.save();
//                       _saveOnDatabase(inModel);
//                       //Navigator.pop(context);
//                       inModel.stackIndex = 0;
//                     }
//                   },
//                 ),
//               ],
//             ),
//           )),
//         );
//       },
//     );
//   }

//   Widget getRadioButton(int radioValue, String rotulo, NotesModel inModel) {
//     return Row(
//       children: [
//         Radio(
//           groupValue: inModel.priority,
//           value: radioValue,
//           onChanged: (var value) {
//             inModel.priority = value;
//             formKey.currentState.save();
//           },
//         ),
//         Text(rotulo)
//       ],
//     );
//   }

//   _saveOnDatabase(NotesModel inModel) async {
//     var helper = DatabaseHelper.helper;
//     if (inModel.note.id != null) {
//       await helper.updateNote(inModel.note);
//     } else {
//       await helper.insertNote(inModel.note);
//     }
//     helper.getCount().then((valor) {
//       print("Valor = $valor");
//     });
//     inModel.loadData();
//   }
// }
