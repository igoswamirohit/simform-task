import 'dart:convert';

import '../drift_db/users_table.dart';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.results,
    required this.info,
  });

  List<RemoteUser> results;
  Info info;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        results: List<RemoteUser>.from(
            json["results"].map((x) => RemoteUser.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
      };
}

class Info {
  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  String seed;
  int results;
  int page;
  String version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class RemoteUser {
  RemoteUser({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.dob,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  String? gender;
  Name? name;
  Location? location;
  String? email;
  Dob? dob;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  factory RemoteUser.fromJson(Map<String, dynamic> json) => RemoteUser(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        dob: Dob.fromJson(json["dob"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromJson(json["id"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  factory RemoteUser.fromUser(User user) => RemoteUser(
        gender: user.gender,
        name: user.name,
        location: user.location,
        email: user.email,
        dob: user.dob,
        phone: user.phone,
        cell: user.cell,
        id: user.id,
        picture: user.picture,
        nat: user.nationality,
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "location": location?.toJson(),
        "email": email,
        "dob": dob?.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id?.toJson(),
        "picture": picture?.toJson(),
        "nat": nat,
      };
}

class Dob {
  Dob({
    required this.date,
    required this.age,
  });

  String date;
  int age;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "age": age,
      };
}

class Id {
  Id({
    required this.name,
    this.value,
  });

  String name;
  String? value;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Location({
    required this.city,
    required this.state,
    required this.country,
  });
  String city;
  String state;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "country": country,
      };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  String title;
  String first;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  String large;
  String medium;
  String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
