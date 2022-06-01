import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultContainer extends StatelessWidget {
  DefaultContainer({required this.cor, required this.childContainer});

  final Color cor;
  final Widget childContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: childContainer),
        margin: EdgeInsets.all(20),
        decoration:
            BoxDecoration(color: cor, borderRadius: BorderRadius.circular(10)));
  }
}
