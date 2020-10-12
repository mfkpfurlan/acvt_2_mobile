import 'package:flutter/material.dart';

Widget buildCard(String header, String content) {
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
        children: <Widget>[
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

Widget buildImgCard(String path, double imgHeight, String description) {
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
          children: <Widget>[
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
