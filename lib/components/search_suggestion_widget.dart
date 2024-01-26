import 'package:flutter/material.dart';
import 'package:ticket_booking/config/theme/theme.dart';
import 'package:ticket_booking/resources/networking/location_resource.dart';

class SearchSuggestionWidget extends StatelessWidget {
  final TextEditingController locationController;

  const SearchSuggestionWidget({super.key, required this.locationController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: LocationResource().getPlaces(locationController.text),
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
                contentPadding: EdgeInsets.zero,
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
