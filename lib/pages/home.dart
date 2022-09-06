import 'dart:convert';
import 'package:conunter/models/destionations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/destinations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future futureDestinations;
  dynamic isDreamDestination = true;

  void setFilter(bool) {
    setState(() {
      isDreamDestination = bool;
    });
  }

  @override
  void initState() {
    super.initState();
    futureDestinations = fetchDestinations();
  }

  Future fetchDestinations() async {
    final uri = Uri.https('travel-api.clicksomeone.com', '/destinations', {
      "filter": jsonEncode({
        "where": {"isDreamDestination": isDreamDestination}
      })
    });
    final response =
        await http.get(uri, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return destionationsFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchDestinations(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Destinations(destinations: snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
