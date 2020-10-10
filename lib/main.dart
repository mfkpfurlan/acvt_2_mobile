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
        primarySwatch: Colors.blue,
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

  Widget _buildCard(String header, String content) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.tealAccent,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    header,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      content,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.amberAccent
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box)),
                Tab(icon: Icon(Icons.account_circle)),
                Tab(icon: Icon(Icons.attach_money))
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
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Some text here",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.all(10.0),
                children: [
                  _buildCard("Nome", "Matheus Furlan")
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
