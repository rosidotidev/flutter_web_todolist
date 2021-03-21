class User {
  String username;
  String code;

  User({
    this.username,
    this.code,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    User m = User(
      username: json["username"],
      code: json["code"],
    );
    return m;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> m = {
      "username": username,
      "code": code,
    };
    return m;
  }

  @override
  int get hashCode {
    int hc = this.code.length + this.username.hashCode;
    return hc;
  }

  @override
  bool operator ==(other) {
    if (other is! User) {
      return false;
    }
    return code + username == (other as User).code + (other as User).username;
  }

  @override
  String toString() {
    return """
    username: $username,
    code: $code,
    ----------------------------------
    """;
  }
}
