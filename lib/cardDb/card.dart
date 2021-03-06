class Card{
  //attr, getters, setters, toMap()
  int _id;
  String _name;
  String _number;
  String _expireOn;
  String _ccv;

  Card(this._name, this._number, this._expireOn, this._ccv);

  Card.withId(this._id, this._name, this._number, this._expireOn, this._ccv);

  Card.fromMap(map) {
    this._id = map["id"];
    this._name = map["title"];
    this._number = map["number"];
    this._expireOn = map["expireOn"];
    this._ccv = map["ccv"];
  }

  int get id => _id;
  String get name => _name;
  String get number => _number;
  String get expireOn => _expireOn;
  String get ccv => _ccv;

  set name(String name) {
    if (name.length > 0) {
      this._name = name;
    }
  }

  set number(String number) {
    if (number.length > 0) {
      this._number = number;
    }
  }

  set expireOn(String expireOn) {
    if (expireOn.length > 0) {
      this._expireOn = expireOn;
    }
  }

  set ccv(String ccv) {
    if (ccv.length > 0) {
      this._ccv = ccv;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();

    if (_id != null) {
      map["id"] = _id;
    }

    map["name"] = _name;
    map["number"] = _number;
    map["expireOn"] = _expireOn;
    map["ccv"] = _ccv;

    return map;
  }
}