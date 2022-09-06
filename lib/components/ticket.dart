import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({Key? key, required this.ticket}) : super(key: key);

  final dynamic ticket;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(ticket['flight']),
        Text(ticket['from']),
        Text(ticket['time']),
        Text(ticket['to']),
      ],
    );
  }
}
