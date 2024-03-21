class User {
  int? id;
  String? username;
  String? token;
  String? name;
  String? contact_number;
  String? email;
  String? gender;

  User(
      {this.id,
      this.username,
      this.contact_number,
      this.name,
      this.email,
      this.gender});

  factory User.fromJson(json) {
    return User(
      id: json["pk"],
      username: json["username"],
      email : json["email"],
      contact_number: json["contact_number"],
      name: json["username"],
    );
  }
}
