import 'package:flutter/material.dart';

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
  String progSentence =
      "Sim, mudei a faculdade de quimica para ADS porque buscava uma profissao que me forcasse a aprender coisas novas constantemente, quimica no laboratorio se mostrou muito repetitivo para mim.";
  String aboutMusic = "Simplemente amo musica. Me considero bem ecletico por gostar de rock, jazz, blues, samba, mpb, classica, eletronica e pagode. O que eu nao gosto eh sertanejo e funk, mas depois de 6 cervejas eu gosto de quase tudo kkkkk. Se eu pudesse recomendar uma musica para voce, seria The Song of the Golden Dragon - Estas Tonne";

  String aboutSports = "Ja pratiquei kung-fu por alguns anos e boxe. Tambem ja nadei em academia e tenho um arco. Hoje em dia apenas caminho por ter uma complicacao no joelho. Gostaria de praticar caiquismo e escalada indoor com certa frequencia no futuro. Nao gosto muito de academia nao, mas como o resultado eh um corpo bonito, ate acabo indo.";

  String aboutCareer = "Eu gosto muito de dados e de business. Na minha empresa o cargo que atende esses requisitos eh Business Analyst. Por gostar muito de dados, faco alguns notebooks de python no tempo livre, tentando descobrir padroes e tirar conclusoes sobre grandes quantidade de dados, mas uma area extremamente tecnica como Engenharia de Dados, visando otimizar algoritmos, nao me atrai tanto no presente.";

  String aboutHobbies = "Gosto muito de cozinhar, porem precisa ser para hobby mesmo, com tempo e ambiente bom. Quando cozinho por obrigacao nao me importo muito com tempeiro e apresentacao, apenas foco nos nutrientes.";

  String enhancement = "Eu posso melhorar esse codigo dividindo as variaveis e funcoes em arquivos alem de nomear melhor as variasveis. Sobre UI vejo que ainda tem bastante chao. A primeira atividade ajudou a entender melhor a hierarquia de widgets do flutter. A segunda atividade me ajudou a me aproveitar mais da documentacao e aprender um pouco de style, mas a tela ainda fica feia. Mesmo sabendo usar todos os widgets da maneira certa, ainda falta um feeling para montar uma boa UI, o que eu nao tenho nem no react hahahaha =(";

  Widget _buildCard(String header, String content) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.elliptical(15, 15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  header,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[900],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 1.0,
              indent: 10.0,
              endIndent: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
                right: 5.0,
                left: 10.0,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImgCard(String path, double imgHeight, String description) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.elliptical(
              15.0,
              15.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Image.asset(
                  path,
                  height: imgHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.indigo,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
              tabs: [
                Tab(icon: Icon(Icons.account_circle)),
                Tab(icon: Icon(Icons.attach_money)),
                Tab(icon: Icon(Icons.blur_linear))
              ],
            ),
          ),
          body: TabBarView(
            children: [
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
                children: [
                  _buildCard("Nome - RA", "Matheus Furlan - 222235"),
                  _buildCard("Curso - Semestre", "TADS - Semestre 6"),
                  _buildCard("Estagio", "CI&T - Dev Full Stack"),
                  _buildCard("O que faz no estagio",
                      "ReactJs, .NET, MSSQL, Automation"),
                  _buildCard("Carreira", aboutCareer),
                  _buildCard("Gosta de programar", progSentence),
                  _buildCard("Sobre Musica", aboutMusic),
                  _buildCard("Esportes", aboutSports),
                  _buildCard("Hobby", aboutHobbies),
                  _buildCard("O que posso melhorar", enhancement),
                  _buildImgCard(
                      'assets/images/baruk.jpg', 200.0, "Eu e o Gi no pub"),
                  _buildImgCard(
                      'assets/images/rave.png', 200.0, "Festinha por ai"),
                  _buildImgCard(
                      'assets/images/zeke.png', 200.0, "Outra festinha"),
                  _buildImgCard(
                      'assets/images/museu.jpg', 200.0, "Museu de Bs.As"),
                  _buildImgCard('assets/images/jardin-japones.jpg', 200.0,
                      "Jardim Japones"),
                  _buildImgCard('assets/images/nu.jpeg', 200.0,
                      "Nubank com a FT e o Plinio"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget theForm() {
    return null;
  }

  Widget theProj() {
    return null;
  }
}
