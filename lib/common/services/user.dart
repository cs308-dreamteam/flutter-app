import 'package:flutter/material.dart';

class User {
  final String username;
  final int followers;
  final Image? image;

  const User({required this.username, this.followers = 0, this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      followers: json['followers'],
      image: json['image'],
    );
  }
}
