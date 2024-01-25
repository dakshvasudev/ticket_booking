import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ticket_booking/config/constants.dart';
import 'package:ticket_booking/config/theme/theme.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 52, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.pin_drop,
                      size: 28,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Enter a location',
                        hintStyle: TextStyle(
                          color: Colors.white30,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      style: typography(context)
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Hey James, lets party!',
                style: typography(context).subtitle2.copyWith(
                    color: Colors.grey,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Pick your experience',
                style: typography(context).title2,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://picsum.photos/200/300?random=$index'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 100,
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Center(
                            child: Text(
                              'HELLO',
                              style: typography(context)
                                  .strong
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Text(
                'CLICK ON THE LOCATION ICON IN RED',
                style: typography(context).title2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
