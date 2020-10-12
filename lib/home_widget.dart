import 'package:flutter/material.dart';
import 'pageAboutMe.dart';
import 'pageForm.dart';
import 'pageProject.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  
  final List<Widget> list = [
    PageAboutMe(),
    PageCreditCardForm(),
    PageProject()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Some title'),
      ),
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
            title: new Text('About me'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.attach_money),
            title: new Text('Form'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.blur_linear),
            title: new Text('Project'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        }
      ),
    );
  }
}