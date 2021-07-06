import 'package:flutter/material.dart';

class CarouselCircle extends StatelessWidget {
  final bool isActive;
  final double radius;
  CarouselCircle({
    this.isActive: true,
    this.radius: 25,
  });
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: this.isActive ? this.radius * 4 : this.radius,
      height: this.radius,
      decoration: BoxDecoration(
        shape: this.isActive ? BoxShape.rectangle : BoxShape.circle,
        color: this.isActive
            ? Theme.of(context).accentColor
            : Theme.of(context).accentColor.withOpacity(0.1),
        borderRadius: this.isActive ? BorderRadius.circular(this.radius) : null,
      ),
    ));
  }
}
