import 'package:flutter/material.dart';
import 'package:ticket_booking/components/ticket_widget.dart';
import 'package:ticket_booking/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 32, 8, 24),
          child: Column(
            children: [
              const Text(
                'Your tickets',
                style: TextStyle(color: Colors.white),
              ),
              TicketWidget(
                  width: MediaQuery.of(context).size.width - 16,
                  height: 200,
                  isCornerRounded: true,
                  colorsList: [Color(0xff275e45), Color(0xff56b295)],
                  color: Colors.blue,
                  child: const TicketData())
            ],
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 75,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/200'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(
                width: 12,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Anuj Jain'),
                  Text('India Tour 2023'),
                  Row(
                    children: [
                      Icon(
                        Icons.share_location,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('03-04-2023, 11:00am - 2:00pm'),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.share_location,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Mumbai Stadium, Mumbai, India'),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 48,
            height: 60.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/barcode.png'),
              fit: BoxFit.cover,
            )),
          ),
        ],
      ),
    );
  }
}
