import 'package:flutter/material.dart';
import './cards.dart';
import './variables.dart';

class PageAboutMe extends StatelessWidget {

  PageAboutMe();

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
}