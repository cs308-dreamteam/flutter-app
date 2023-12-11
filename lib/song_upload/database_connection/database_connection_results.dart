import 'package:flutter/material.dart';

class DatabaseConnectionResults extends StatelessWidget {
  final String? results;
  const DatabaseConnectionResults({Key? key, this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(results);
    if (results == null) return Scaffold();
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: results!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results![index].toString()),
          );
        },
      )),
    );
  }
}
