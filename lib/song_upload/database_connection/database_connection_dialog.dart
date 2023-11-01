import 'package:bragi/common/services/validators.dart';
import 'package:bragi/common/widgets/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sql_conn/sql_conn.dart';

class DatabaseConnectionDialog extends StatelessWidget {
  final TextEditingController ipAddr = TextEditingController();
  final TextEditingController port = TextEditingController();
  final TextEditingController dbName = TextEditingController();
  final TextEditingController tableName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  DatabaseConnectionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          SimpleTextField(
            fieldLabel: "IP Address",
            fieldHint: "IP Address",
            controller: ipAddr,
            validator: (value) {
              if (!Validator.isIPAddressValid(value)) {
                return "Invalid IP Address";
              }
              return null;
            },
          ),
          SimpleTextField(
            fieldLabel: "Port",
            fieldHint: "Port",
            controller: port,
            validator: (value) {
              if (!Validator.isPortValid(value)) {
                return "Invalid Port";
              }
              return null;
            },
          ),
          SimpleTextField(
            fieldLabel: "Database Name",
            fieldHint: "Database Name",
            controller: dbName,
          ),
          SimpleTextField(
            fieldLabel: "Table Name",
            fieldHint: "Table Name",
            controller: tableName,
          ),
          SimpleTextField(
            fieldLabel: "Username",
            fieldHint: "Username",
            controller: username,
          ),
          SimpleTextField(
            fieldLabel: "Password",
            fieldHint: "Password",
            controller: password,
          ),
          ElevatedButton(
            onPressed: () async {
              await SqlConn.connect(
                ip: ipAddr.text,
                port: port.text,
                databaseName: dbName.text,
                username: username.text,
                password: password.text,
              );
              if (!context.mounted) return;
              context.go(
                '/databaseConnectionResults',
                extra: {
                  'results': await SqlConn.readData(
                      "SELECT * FROM ${tableName.text};"),
                },
              );
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
