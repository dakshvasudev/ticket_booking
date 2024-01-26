import 'package:flutter/material.dart';
import 'package:ticket_booking/config/constants.dart';
import 'package:ticket_booking/config/theme/theme.dart';

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
        margin: const EdgeInsets.only(left: 6.0, right: 6.0),
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
