import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/config.dart';
import 'package:idnshop/src/utils/svg_data.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgData.bag,
              colorFilter: ColorFilter.mode(
                CustomColor.secondary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 4)
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Lottie.asset(
              'assets/lottie/person-desk.json',
              width: 300,
            ),
            const SizedBox(height: 32),
            Text(
              'Unfortunately, chat is currently not available.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text('Frequently Asked Questions'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: CustomColor.border,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'OR\nContact us via',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 1,
                    color: CustomColor.border,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      const url = 'https://wa.me/${Config.whatsappNumber}';
                      if (!await launchUrlString(url)) {
                        Fluttertoast.showToast(
                          msg: 'Something went wrong',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: CustomColor.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    label: Text('WhatsApp us'),
                    icon: SvgPicture.asset(
                      SvgData.whatsapp,
                      colorFilter: ColorFilter.mode(
                        CustomColor.green,
                        BlendMode.srcIn,
                      ),
                      width: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      const url = 'mailto:${Config.emailAddress}';
                      if (!await launchUrlString(url)) {
                        Fluttertoast.showToast(
                          msg: 'Something went wrong',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          backgroundColor: CustomColor.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    label: Text('Email us'),
                    icon: SvgPicture.asset(
                      SvgData.atSign,
                      colorFilter: ColorFilter.mode(
                        CustomColor.secondary1,
                        BlendMode.srcIn,
                      ),
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            FilledButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'Chat is under development',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: CustomColor.red,
                  textColor: Colors.white,
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text('Chat with us'),
            )
          ],
        ),
      ),
    );
  }
}
