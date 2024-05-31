import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class LoginReminder extends StatelessWidget {
  LoginReminder({
    super.key,
  });

  final List<String> words = [
    "Hi, IDNthusiast!",
    "Time to Shop 'n' Hop!",
    "Shop 'til You Drop",
    "IDNShop is calling!",
  ];

  String getWord() {
    return words[Random().nextInt(words.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            SvgData.robotHead,
            width: 40,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getWord(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                'Unlock deals, easy checkout~',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const Spacer(),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: Size(0, 40),
            ),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
