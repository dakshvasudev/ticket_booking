import 'package:flutter/material.dart';
import 'package:ticket_booking/config/constants.dart';
import 'package:ticket_booking/config/theme/theme.dart';
import 'package:ticket_booking/resources/networking/location_resource.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({super.key});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

const List<String> cities = ['Jaipur', 'Bangalore', 'Delhi', 'Hyderabad'];

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  final TextEditingController _locationController = TextEditingController();
  bool _isOverlayVisible = false;
  final LocationResource _locationResource = LocationResource();

  void _showLocationInputDialog(BuildContext context) {
    _toggleOverlay();
  }

  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 52, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _showLocationInputDialog(context),
                        icon: const Icon(
                          Icons.pin_drop,
                          size: 28,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Indira Nagar',
                        style: typography(context)
                            .subtitle1
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(),
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
          if (_isOverlayVisible)
            GestureDetector(
              onTap: () {
                _toggleOverlay();
              },
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          if (_isOverlayVisible)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(),
                ),
                padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose your location',
                          style: typography(context).title3,
                        ),
                        IconButton(
                            onPressed: () {
                              _toggleOverlay();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 28,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              cursorHeight: 16,
                              controller: _locationController,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: typography(context)
                                    .body
                                    .copyWith(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              onChanged: (query) {
                                setState(() {});
                              },
                            ),
                          ),
                          if (_locationController.text.isNotEmpty)
                            IconButton(
                              onPressed: () {
                                _locationController.clear();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.clear,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (_locationController.text.isEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Transform.rotate(
                                angle: 0.8,
                                child: const Icon(
                                  Icons.navigation,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Detect my location',
                                style: typography(context).body.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Suggested',
                            style: typography(context).strong,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 90,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: cities.length,
                                itemBuilder: (context, index) {
                                  return SuggestedCityIcon(
                                    onPressed: () {
                                      _locationController.text = cities[index];
                                      setState(() {});
                                    },
                                    cityName: cities[index],
                                  );
                                }),
                          ),
                        ],
                      ),
                    if (_locationController.text.isNotEmpty)
                      SearchSuggestionWidget(
                        locationResource: _locationResource,
                        locationController: _locationController,
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SuggestedCityIcon extends StatelessWidget {
  const SuggestedCityIcon(
      {super.key, required this.cityName, required this.onPressed});
  final String cityName;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 90,
        width: 90,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
        child: Column(
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 36,
            ),
            const Spacer(),
            Text(
              cityName,
              style: typography(context).smallBody,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchSuggestionWidget extends StatelessWidget {
  final LocationResource locationResource;
  final TextEditingController locationController;

  const SearchSuggestionWidget(
      {super.key,
      required this.locationResource,
      required this.locationController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: locationResource.getPlaces(locationController.text),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: CircularProgressIndicator(),
          ));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'No Suggestions found',
              style: typography(context).strongSmallBody,
            ),
            onTap: () {
              print('Selected: No Suggestions found');
            },
          );
        } else {
          final suggestions = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: suggestions.length <= 5 ? suggestions.length : 5,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  suggestions[index],
                  style: typography(context).strongSmallBody,
                ),
                onTap: () {
                  locationController.text = suggestions[index];
                },
              );
            },
          );
        }
      },
    );
  }
}
