library common;

// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const String API_URL = "http://192.168.124.66:8000/api/";
// ignore: constant_identifier_names
const String BASE_URL = "http://192.168.124.66:8000";

// ignore: constant_identifier_names
const double MIN_HEIGHT = 130;
// ignore: constant_identifier_names
const double MAX_HEIGHT = 210;

// ignore: constant_identifier_names
const PRIMARY_FONT_COLOR = Color.fromARGB(255, 48, 61, 87);
// ignore: constant_identifier_names
const PRIMARY_GREY = Color.fromARGB(255, 237, 243, 243);
// ignore: constant_identifier_names
const BUTTON_MAIN = Color.fromARGB(255, 0, 202, 157);

class AddressObject {
  String address;
  bool isChecked;
  int idx;

  AddressObject(this.idx, this.address, this.isChecked);
}

class CommunityObject {
  String label;
  bool isChecked;
  int category;
  int idx;
  int parent;
  String image;

  CommunityObject(this.idx, this.label, this.isChecked, this.parent,
      this.category, this.image);
}

class UsersObject {
  String label;
  bool isChecked;
  bool isNew;
  String category;
  int idx;
  String image;

  UsersObject(this.idx, this.label, this.isChecked, this.isNew, this.category,
      this.image);
}

class BadgeObject {
  String title;
  bool isChecked;
  int color;

  BadgeObject(this.title, this.isChecked, this.color);
}

class BadgeItemObject {
  int id;
  String title;
  bool isChecked;
  String color;
  BadgeItemObject(this.id, this.title, this.isChecked, this.color);
}

class BodyTypeObject {
  int id;
  String title;

  BodyTypeObject(this.id, this.title);
}
