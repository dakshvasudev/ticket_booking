import 'package:flutter/material.dart';
import 'package:ticket_booking/components/ticket_data_widget.dart';
import 'package:ticket_booking/components/ticket_widget.dart';
import 'package:ticket_booking/config/constants.dart';
import 'package:ticket_booking/resources/tickets/dummy_data_for_tickets.dart';

class HistoryTabHomePage extends StatelessWidget {
  const HistoryTabHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        3,
        (index) {
          return Positioned(
            top: index * 82,
            child: TicketWidget(
              margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              width: MediaQuery.of(context).size.width - 16,
              height: 200,
              isCornerRounded: true,
              colorsList: colorsList[index % colorsList.length],
              color: Colors.blue,
              child: TicketData(
                singerInfo: singerInfoList[index],
                imageLink: 'https://picsum.photos/200/300?random=$index',
              ),
            ),
          );
        },
      ),
    );
  }
}
