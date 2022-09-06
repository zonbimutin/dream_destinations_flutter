import 'package:conunter/pages/flights.dart';
import 'package:flutter/material.dart';

class Destinations extends StatelessWidget {
  const Destinations({Key? key, required this.destinations}) : super(key: key);

  final List destinations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between line
          children: destinations
              .map(
                (destination) => ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlightsPage(
                                code: destination.code,
                                title: destination.name,
                              )),
                    );
                  },
                  child: Text(destination.name),
                ),
              )
              .toList()),
    );
  }
}
