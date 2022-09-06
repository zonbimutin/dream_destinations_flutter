import 'package:flutter/material.dart';

import 'ticket.dart';

class Tickets extends StatelessWidget {
  const Tickets({Key? key, required this.tickets}) : super(key: key);

  final List tickets;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
          // gap between line
          children: tickets
              .map(
                (item) => Ticket(ticket: item),
              )
              .toList()),
    );
  }
}
