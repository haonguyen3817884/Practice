import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List<String> testTexts = ["place", "place", "place", "place"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: testTexts.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(testTexts[index]));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: testTexts.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(query));
        });
  }
}
