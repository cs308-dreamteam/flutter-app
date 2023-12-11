import 'package:bragi/common/services/users.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PeopleSearchBar extends StatelessWidget {
  const PeopleSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showPeopleSearch(context),
      child: Text("Search"),
    );
  }

  void showPeopleSearch(BuildContext context) async {
    List<String> usernames = await Users.getUsernames();
    if (!context.mounted) return;
    showSearch(
      context: context,
      delegate: PeopleSearchDelegate(usernames),
    );
  }
}

class PeopleSearchDelegate extends SearchDelegate {
  final List<String> usernames;
  PeopleSearchDelegate(this.usernames);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = usernames.where((username) {
      return username.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        String username = results[index];
        return ListTile(
          title: Text(username),
          onTap: () => context.go('/profile/$username'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = usernames.where((username) {
      return username.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        String username = suggestions[index];
        return ListTile(
          title: Text(username),
          onTap: () => context.go('/users/$username'),
        );
      },
    );
  }
}
