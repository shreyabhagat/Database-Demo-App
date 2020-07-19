class Student {
  int id;
  String name;
  String branch;

  Student({this.id, this.name, this.branch});

  Student.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.branch = map['branch'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this.id;
    map['name'] = this.name;
    map['branch'] = this.branch;

    return map;
  }
}
