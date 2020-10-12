import 'package:flutter/material.dart';

class PageCreditCardForm extends StatefulWidget {

  PageCreditCardForm();

  @override
  _PageCreditCardFormState createState() => _PageCreditCardFormState();
}

class _PageCreditCardFormState extends State<PageCreditCardForm> {

  final creditCardFormKey = GlobalKey<FormState>();

  String name, number, expireOn, ccv;
  double ammount = 0.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.indigo[700],
              ),
              child: Form(
                key: creditCardFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
}