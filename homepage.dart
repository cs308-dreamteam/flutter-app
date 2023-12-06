import 'package:flutter/material.dart';

import 'HorScrList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Analysis Page
          Card(
            elevation: 5,
            child: ListTile(
              title: Text('Analysis Page'),
              leading: Icon(Icons.bar_chart),
              onTap: () {
                // TODO: Implement navigation to Analysis Page
              },
            ),
          ),
          SizedBox(height: 16),
          // My Playlists
          Card(
            elevation: 5,
            child: ListTile(
              title: Text('My Playlists'),
              leading: Icon(Icons.library_music),
              onTap: () {
                // TODO: Implement My Playlists navigation
              },
            ),
          ),
          SizedBox(height: 16),
          // Recommendations
          Card(
            elevation: 5,
            child: ListTile(
              title: Text('Recommendations'),
              leading: Icon(Icons.star),
              onTap: () {
                Navigator.pushNamed(context, '/recommended');
              },
            ),
          ),
          // More content here
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Your Name'),
              accountEmail: Text('your.email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.account_circle,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
