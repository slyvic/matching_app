library common;

import 'package:flutter/material.dart';

const double MIN_HEIGHT = 130;
const double MAX_HEIGHT = 210;

const PRIMARY_FONT_COLOR = Color.fromARGB(255, 48, 61, 87);
const PRIMARY_GREY = Color.fromARGB(255, 237, 243, 243);
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
  int parent;
  String category;
  int idx;

  CommunityObject(
      this.idx, this.label, this.isChecked, this.parent, this.category);
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
