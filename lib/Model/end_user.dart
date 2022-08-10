import 'dart:convert';

EndUser endUserFromJson(String str) => EndUser.fromJson(json.decode(str));

String endUserToJson(EndUser data) => json.encode(data.toJson());

class EndUser {
  EndUser({
    required this.uid,
    this.email,
    this.fullname,
    this.phone,
    this.avatarUrl,
  });

  String uid;
  String? email;
  String? fullname;
  String? phone;
  String? avatarUrl;

  factory EndUser.fromJson(Map<String, dynamic> json) => EndUser(
        uid: json["uid"],
        email: json["email"],
        fullname: json["fullname"],
        phone: json["phone"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "fullname": fullname,
        "phone": phone,
        "avatar_url": avatarUrl,
      };
}
