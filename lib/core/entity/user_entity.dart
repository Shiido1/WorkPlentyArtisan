class UserEntity {
  String? avatar;
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? age;
  String? origin;
  String? lga;
  String? education;
  String? ideology;
  String? belief;
  String? updatedAt;
  String? createdAt;
  String? token;

  UserEntity(
      {this.avatar,
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.age,
      this.origin,
      this.lga,
      this.education,
      this.ideology,
      this.belief,
      this.updatedAt,
      this.createdAt,
      this.token});

  UserEntity.fromJson(Map<String, dynamic> json) {
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["first_name"] is String) {
      firstName = json["first_name"];
    }
    if (json["last_name"] is String) {
      lastName = json["last_name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["age"] is int) {
      age = json["age"];
    }
    if (json["origin"] is String) {
      origin = json["origin"];
    }
    if (json["lga"] is String) {
      lga = json["lga"];
    }
    if (json["education"] is String) {
      education = json["education"];
    }
    if (json["ideology"] is String) {
      ideology = json["ideology"];
    }
    if (json["belief"] is String) {
      belief = json["belief"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> userEntity = <String, dynamic>{};
    userEntity["avatar"] = avatar;
    userEntity["user_id"] = userId;
    userEntity["first_name"] = firstName;
    userEntity["last_name"] = lastName;
    userEntity["email"] = email;
    userEntity["phone"] = phone;
    userEntity["age"] = age;
    userEntity["origin"] = origin;
    userEntity["lga"] = lga;
    userEntity["education"] = education;
    userEntity["ideology"] = ideology;
    userEntity["belief"] = belief;
    userEntity["updatedAt"] = updatedAt;
    userEntity["createdAt"] = createdAt;
    userEntity["token"] = token;
    return userEntity;
  }
}
