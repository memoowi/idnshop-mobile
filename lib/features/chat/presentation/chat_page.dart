import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/secrets/config.dart';
import 'package:idnshop/core/theme/lottie_data.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        automaticallyImplyLeading: false,
        actions: const [OpenCartButton(), SizedBox(width: 4)],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Lottie.asset(
              LottieData.personDesk,
              width: 300,
              reverse: true,
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
                minimumSize: const Size(double.infinity, 50),
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
                  'OR\nContact us on',
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
                    label: const Text('WhatsApp'),
                    icon: SvgPicture.asset(
                      SvgData.whatsapp,
                      colorFilter: const ColorFilter.mode(
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
                    label: const Text('Email'),
                    icon: SvgPicture.asset(
                      SvgData.atSign,
                      colorFilter: const ColorFilter.mode(
                        CustomColor.primary,
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
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Chat with us'),
            )
          ],
        ),
      ),
    );
  }
}
