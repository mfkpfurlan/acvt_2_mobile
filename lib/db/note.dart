class Note {
  int _id;
  int _priority;
  String _title;
  String _description;

  Note(this._title, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._priority, [this._description]);

  Note.fromMap(map) {
    this._id = map["id"];
    this._title = map["title"];
    this._description = map["description"];
    this._priority = map["priority"];
  }

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length > 0) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length > 0) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      this._priority = newPriority;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map["id"] = _id;
    }

    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    return map;
  }
}
