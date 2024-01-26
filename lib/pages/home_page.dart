import 'package:flutter/material.dart';
import 'package:ticket_booking/components/ticket_data_widget.dart';
import 'package:ticket_booking/components/ticket_widget.dart';
import 'package:ticket_booking/config/constants.dart';
import 'package:ticket_booking/config/theme/theme.dart';
import 'package:ticket_booking/resources/tickets/dummy_data_for_tickets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
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
                    setState(() {
                      _tabController.animateTo(index);
                    });
                  },
                  children: [
                    Center(
                      child: Text(
                        'FOR THE GIVEN TASK - CLICK ON HISTORY TAB ',
                        style: typography(context).strong,
                      ),
                    ),
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
                                imageLink:
                                    'https://picsum.photos/200/300?random=$index',
                              ),
                            ),
                          );
                        },
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
