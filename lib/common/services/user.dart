import 'dart:convert';

import 'package:bragi/common/services/global_variables.dart';
import 'package:flutter/material.dart';

class User {
  final String username;
  final int followers;
  final Image? image;

  const User({required this.username, this.followers = 0, this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
    );
  }

  Future<dynamic> getAnalysisData() async {
    var response = await GlobalVariables.client
        .send(method: 'GET', path: '/analysis_data');

    var decodedResponse = jsonDecode(await response.stream.bytesToString());

    print(decodedResponse);

    return decodedResponse;
  }
}
