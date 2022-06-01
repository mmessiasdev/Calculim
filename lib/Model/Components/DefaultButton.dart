import 'package:flutter/material.dart';

class DeafaultButton extends StatelessWidget {
  const DeafaultButton({required this.tap, required this.icon});

  final VoidCallback tap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        child: Center(child: GestureDetector(onTap: tap, child: icon)));
  }
}
