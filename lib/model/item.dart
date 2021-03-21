class Item {
  String name;
  String code;
  bool selected = false;

  Item({this.name = '', this.code});

  factory Item.fromJson(Map<String, dynamic> json) {
    Item c = Item(
      name: json["item"],
      code: json["code"],
    );
    return c;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> m = {
      "item": name,
      "code": code,
    };
    return m;
  }

  @override
  String toString() {
    return """
    code: $code
    name: $name
    """;
  }
}
