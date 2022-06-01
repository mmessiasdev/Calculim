import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Styles.dart';

class DefaultCard extends StatelessWidget {
  DefaultCard({required this.title, required this.subTitle});

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: kfourthText,
          ),
        ),
        Center(
          child: Text(
            subTitle,
            style: kthirdText,
          ),
        ),
      ],
    );
  }
}
