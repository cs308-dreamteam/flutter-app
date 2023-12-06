import 'package:flutter/material.dart';

class RecommendedPage extends StatelessWidget {
  final List<String> recommendedSongs = [
    "Song 1",
    "Song 2",
    "Song 3",
    "Song 4",
    "Song 5",
    "Song 6"
  ];
  final List<String> recommendedArtists = [
    "Artist 1",
    "Artist 2",
    "Artist 3",
    "Artist 4",
    "Artist 5",
    "Artist 6"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommendations"),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recommended Songs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: recommendedSongs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(recommendedSongs[index]),
                          // onTap: for tapping a song
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recommended Artists",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: recommendedArtists.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(recommendedArtists[index]),
                          // onTap: for tapping an artist
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
