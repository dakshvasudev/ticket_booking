import 'package:flutter/material.dart';
import 'package:ticket_booking/config/theme/placebo_typography.dart';

PlaceboTypography typography(BuildContext context) {
  return Theme.of(context).extension<PlaceboTypography>() ?? textTheme;
}
