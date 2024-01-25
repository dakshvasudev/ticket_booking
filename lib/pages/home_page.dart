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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<List<Color>> colorsList = const [
    [Color(0xffa9507c), Color(0xFFDB86AD)],
    [Color(0xff7b4fd0), Color(0xFFA382E6)],
    [Color(0xff275e45), Color(0xff56b295)],
    [Color(0xff987654), Color(0xfffedcba)],
    [Color(0xff112233), Color(0xff445566)],
  ];

  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 52, 8, 24),
          child: Column(
            children: [
              Text(
                'Your tickets',
                style: typography(context).title1,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      setState(() {
                        _tabController.index = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _tabController.index == 0
                            ? Colors.red
                            : Colors.white12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text('Upcoming',
                          style: typography(context).smallBody),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      setState(() {
                        _tabController.index = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _tabController.index == 1
                            ? Colors.red
                            : Colors.white12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child:
                          Text('History', style: typography(context).smallBody),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController.animateTo(index);
                  },
                  children: [
                    // Upcoming Tab
                    Stack(
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
                    // History Tab (You can replace this with your history implementation)
                    Center(
                      child: Text(
                        'History Tab Content',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
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
