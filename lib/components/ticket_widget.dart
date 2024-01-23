import 'package:flutter/material.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.colorsList,
    this.isCornerRounded = false,
    this.shadow,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;
  final Color? color;
  final List<Color>? colorsList;
  final bool isCornerRounded;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadow;

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        child: widget.child,
        duration: const Duration(seconds: 1),
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          boxShadow: widget.shadow,
          color: widget.color,
          gradient: widget.colorsList != null
              ? LinearGradient(colors: widget.colorsList!)
              : null,
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(20.0)
              : BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    double radius = 8.0;
    path.addOval(
        Rect.fromCircle(center: Offset(size.width / 2, 10), radius: 16));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width / 2, 210), radius: 16));

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 8), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 8), radius: radius));
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 4), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 4), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2.7), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2.7), radius: radius));
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 1.6), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.6), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 1.32), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.32), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 1.13), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.13), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
