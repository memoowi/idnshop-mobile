import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class LoginReminder extends StatelessWidget {
  const LoginReminder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            SvgData.robotHead,
            width: 40,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, IDNthusiast!',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                'Unlock deals, easy checkout~',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          Spacer(),
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
