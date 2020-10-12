import 'package:flutter/material.dart';
import './cards.dart';

class PageProject extends StatelessWidget {

  PageProject();

  @override
  Widget build(BuildContext context) {
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