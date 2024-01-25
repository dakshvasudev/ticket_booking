import 'package:flutter/material.dart';
import 'package:ticket_booking/components/ticket_widget.dart';
import 'package:ticket_booking/config/constants.dart';
import 'package:ticket_booking/config/theme/theme.dart';
import 'package:ticket_booking/resources/tickets/dummy_data_for_tickets.dart';
import 'package:ticket_booking/resources/tickets/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<Color>> colorsList = const [
    [Color(0xffa9507c), Color(0xFFDB86AD)],
    [Color(0xff7b4fd0), Color(0xFFA382E6)],
    [Color(0xff275e45), Color(0xff56b295)],
    [Color(0xff987654), Color(0xfffedcba)],
    [Color(0xff112233), Color(0xff445566)],
    // Add more lists of colors as needed
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 32, 8, 24),
          child: Column(
            children: [
              Text(
                'Your tickets',
                style: typography(context).title1,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Stack(
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Expanded(
              //   child: Stack(
              //     children: List.generate(
              //       2,
              //       (index) {
              //         final dataIndex = singerInfoList.length - 2 + index;
              //         return Positioned(
              //           top: index * 74 + 200,
              //           child: TicketWidget(
              //             margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              //             width: MediaQuery.of(context).size.width - 16,
              //             height: 180,
              //             isCornerRounded: true,
              //             colorsList: colorsList[dataIndex],
              //             color: Colors.blue,
              //             child: TicketData(
              //               singerInfo: singerInfoList[dataIndex],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({Key? key, required this.singerInfo}) : super(key: key);

  final SingerInfo singerInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                'W893458DFJVB923',
                style: typography(context).preTitle,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/80/75'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    singerInfo.name,
                    style: typography(context).title3,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    singerInfo.event,
                    style: typography(context).smallBody,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop_sharp,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        singerInfo.dateAndTime,
                        style: typography(context).smallBody,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop_sharp,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(singerInfo.venue,
                          style: typography(context).smallBody),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 48,
            height: 45.0,
            margin: const EdgeInsets.only(left: 7),
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
