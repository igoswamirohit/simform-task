// stores preferences as strings
import 'dart:convert';

import 'package:drift/drift.dart';

import '../models/user_response.dart';

//Few converters are created here to store the data in string format in normal TextColumn & convert them back into Objects

class NameConverter extends TypeConverter<Name, String> {
  const NameConverter();

  @override
  Name fromSql(String fromDb) {
    return Name.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Name value) {
    return json.encode(value.toJson());
  }
}

class IdConverter extends TypeConverter<Id, String> {
  const IdConverter();

  @override
  Id fromSql(String fromDb) {
    return Id.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Id value) {
    return json.encode(value.toJson());
  }
}

class PictureConverter extends TypeConverter<Picture, String> {
  const PictureConverter();

  @override
  Picture fromSql(String fromDb) {
    return Picture.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Picture value) {
    return json.encode(value.toJson());
  }
}

class LocationConverter extends TypeConverter<Location, String> {
  const LocationConverter();

  @override
  Location fromSql(String fromDb) {
    return Location.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Location value) {
    return json.encode(value.toJson());
  }
}

class DobConverter extends TypeConverter<Dob, String> {
  const DobConverter();

  @override
  Dob fromSql(String fromDb) {
    return Dob.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Dob value) {
    return json.encode(value.toJson());
  }
}