import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/address/data/address_data.dart';
import 'package:idnshop/features/address/presentation/delete_address_dialog.dart';
import 'package:idnshop/features/address/presentation/address_dialog.dart';
import 'package:idnshop/features/address/widgets/address_tile.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final List<AddressData> addresses = AddressData.getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddressDialog(
                        isEdit: false,
                      );
                    },
                  );
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Add New Address'),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ...List.generate(
                    addresses.length,
                    (index) => AddressTile(
                      data: addresses[index],
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddressDialog(
                              addressData: addresses[index],
                            );
                          },
                        );
                      },
                      onSetAsDefault: () {
                        Fluttertoast.showToast(
                          msg: 'Default address set',
                          gravity: ToastGravity.TOP,
                          backgroundColor: CustomColor.green,
                        );
                      },
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteAddressDialog();
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
