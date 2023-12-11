import 'package:bragi/common/services/validators.dart';
import 'package:bragi/common/widgets/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mysql_client/mysql_client.dart';

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
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Wrap(
            direction: Axis.vertical,
            spacing: 20,
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
                  var conn = await MySQLConnection.createConnection(
                    host: ipAddr.text,
                    port: int.parse(port.text),
                    databaseName: dbName.text,
                    userName: username.text,
                    password: password.text,
                  );
                  await conn.connect();
                  if (!context.mounted) return;
                  if (!conn.connected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed to connect to database"),
                      ),
                    );
                    return;
                  }
                  context.push(
                    '/databaseConnectionResults/${(await conn.execute("SELECT * FROM ${tableName.text};")).rows.map((e) => e.typedAssoc())}',
                  );
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
