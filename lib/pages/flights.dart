import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../components/tickets.dart';

class FlightsPage extends StatefulWidget {
  const FlightsPage({super.key, required this.title, required this.code});
  final String title;
  final String code;

  @override
  State<FlightsPage> createState() => FlightsPageState();
}

class FlightsPageState extends State<FlightsPage> {
  @override
  void initState() {
    super.initState();
  }

  Future fetchTickets(id) async {
    final uri = Uri.https('travel-api.clicksomeone.com', '/tickets', {
      "filter": jsonEncode({
        "where": {"to": id}
      })
    });
    final response =
        await http.get(uri, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
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
          future: fetchTickets(widget.code),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Tickets(tickets: snapshot.data);
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
