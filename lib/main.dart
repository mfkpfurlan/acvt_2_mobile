import 'package:flutter/material.dart';

import './cards.dart';
import './variables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final creditCardFormKey = GlobalKey<FormState>();

  String name, number, expireOn, ccv;
  double ammount = 0.5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Some Title",
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Another title"),
            backgroundColor: Colors.indigo[900],
            bottom: TabBar(
              tabs: <Tab>[
                Tab(icon: Icon(Icons.account_circle)),
                Tab(icon: Icon(Icons.attach_money)),
                Tab(icon: Icon(Icons.blur_linear))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: aboutMe()),
              Center(child: theForm()),
              Center(child: theProj())
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutMe() {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(00.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 120,
              decoration: BoxDecoration(
                color: Colors.indigo[700],
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  buildCard("Nome - RA", "Matheus Furlan - 222235"),
                  buildCard("Curso - Semestre", "TADS - Semestre 6"),
                  buildCard("Estagio", "CI&T - Dev Full Stack"),
                  buildCard("O que faz no estagio",
                      "ReactJs, .NET, MSSQL, Automation"),
                  buildCard("Carreira", aboutCareer),
                  buildCard("Gosta de programar", progSentence),
                  buildCard("Sobre Musica", aboutMusic),
                  buildCard("Esportes", aboutSports),
                  buildCard("Hobby", aboutHobbies),
                  buildCard("O que posso melhorar", enhancement),
                  buildImgCard(
                      'assets/images/baruk.jpg', 200.0, "Eu e o Gi no pub"),
                  buildImgCard(
                      'assets/images/rave.png', 200.0, "Festinha por ai"),
                  buildImgCard(
                      'assets/images/zeke.png', 200.0, "Outra festinha"),
                  buildImgCard(
                      'assets/images/museu.jpg', 200.0, "Museu de Bs.As"),
                  buildImgCard('assets/images/jardin-japones.jpg', 200.0,
                      "Jardim Japones"),
                  buildImgCard('assets/images/nu.jpeg', 200.0,
                      "Nubank com a FT e o Plinio"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget theForm() {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.indigo[700],
              ),
              child: Form(
                key: creditCardFormKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(5.0, 5.0),
                              ),
                            ),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Name as it is on the card",
                                labelText: "Name *",
                              ),
                              validator: (String inValue) {
                                return (inValue.length == 0
                                    ? "Name required"
                                    : null);
                              },
                              onSaved: (String inValue) {
                                name = inValue;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(5.0, 5.0),
                              ),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                icon: Icon(Icons.credit_card),
                                hintText: "Numbers Only",
                                labelText: "Card Number *",
                              ),
                              validator: (String inValue) {
                                return (inValue.length == 16 &&
                                        isNumeric(inValue))
                                    ? null
                                    : "Must have 16 numbers only";
                              },
                              onSaved: (String inValue) {
                                number = inValue;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(5.0, 5.0),
                              ),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                hintText: "",
                                labelText: "Expires On *",
                              ),
                              validator: (String inValue) {
                                return null;
                              },
                              onSaved: (String inValue) {
                                expireOn = inValue;
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(5.0, 5.0),
                              ),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                icon: Icon(Icons.security),
                                hintText: "",
                                labelText: "CCV *",
                              ),
                              validator: (String inValue) {
                                return inValue.length == 3 && isNumeric(inValue)
                                    ? null
                                    : "Must have 3 numbers only";
                              },
                              onSaved: (String inValue) {
                                ccv = inValue;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(5.0, 5.0),
                          ),
                        ),
                        child: Slider(
                          min: 0,
                          max: 1000,
                          value: ammount,
                          onChanged: (double value) {
                            setState(() {
                              ammount = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            submit();
                          },
                          color: Colors.green[500],
                          child: Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    if (creditCardFormKey.currentState.validate()) {
      creditCardFormKey.currentState.save();
      print("$name, $number, $expireOn, $ccv, $ammount");
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Widget theProj() {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(00.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 120,
              decoration: BoxDecoration(
                color: Colors.indigo[700],
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  buildCard("Tema", "Urna Eletronica"),
                  buildImgCard(
                      'assets/images/urna.jpg', 200, 'Foto ilustrativa'),
                  buildCard("Dados salvos no servidor",
                      "Candidatos (img, legenda, social, etc), Dados de login."),
                  buildCard("Dados salvos no cliente",
                      "Cola eleitoral (local para salvar o candidato que deseja votar"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
