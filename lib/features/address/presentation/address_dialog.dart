import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/common/utils/no_leading_spaces_formatter.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/address/data/address_data.dart';

class AddressDialog extends StatefulWidget {
  final AddressData? addressData;
  final bool isEdit;
  const AddressDialog({
    super.key,
    this.addressData,
    this.isEdit = true,
  });

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  final formKey = GlobalKey<FormState>();
  final recepientNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final otherDetailsController = TextEditingController();

  String? validatorName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    } else if (!value.contains(RegExp(r'^(?=.*[a-zA-Z])[a-zA-Z0-9 ]+$'))) {
      return 'Invalid name';
    }
    return null;
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  void initState() {
    recepientNameController.text = widget.addressData?.name ?? '';
    phoneController.text = widget.addressData?.phoneNumber ?? '';
    addressController.text = widget.addressData?.address ?? '';
    postalCodeController.text = widget.addressData?.postalCode ?? '';
    otherDetailsController.text = widget.addressData?.otherDetails ?? '';
    super.initState();
  }

  @override
  void dispose() {
    recepientNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    otherDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.isEdit ? 'Edit Address' : 'Add Address',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: validatorName,
                  controller: recepientNameController,
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Recepient Name',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  inputFormatters: [
                    NoLeadingSpacesFormatter(),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: validator,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a province';
                    }
                    return null;
                  },
                  hint: const Text('Province'),
                  value: widget.addressData?.province,
                  style: Theme.of(context).textTheme.bodyMedium,
                  dropdownColor: Colors.white,
                  items: [
                    DropdownMenuItem(
                      value: '',
                      enabled: false,
                      child: Text('Please select a province'),
                    ),

                    // DUMMY
                    widget.addressData?.province != null
                        ? DropdownMenuItem(
                            value: widget.addressData?.province,
                            child: Text(widget.addressData?.province ?? ''),
                          )
                        : DropdownMenuItem(
                            value: 'Province 1',
                            child: Text('Province 1'),
                          ),
                  ],
                  onChanged: (value) {
                    // Do something
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a city';
                    }
                    return null;
                  },
                  hint: const Text('City'),
                  value: widget.addressData?.city,
                  style: Theme.of(context).textTheme.bodyMedium,
                  dropdownColor: Colors.white,
                  items: [
                    DropdownMenuItem(
                      value: '',
                      enabled: false,
                      child: Text('Please select a city'),
                    ),

                    // DUMMY
                    widget.addressData?.city != null
                        ? DropdownMenuItem(
                            value: widget.addressData?.city,
                            child: Text(widget.addressData?.city ?? ''),
                          )
                        : DropdownMenuItem(
                            value: 'City 1',
                            child: Text('City 1'),
                          ),
                  ],
                  onChanged: (value) {
                    // Do something
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a district';
                    }
                    return null;
                  },
                  hint: const Text('District'),
                  value: widget.addressData?.district,
                  style: Theme.of(context).textTheme.bodyMedium,
                  dropdownColor: Colors.white,
                  items: [
                    DropdownMenuItem(
                      value: '',
                      enabled: false,
                      child: Text('Please select a district'),
                    ),

                    // DUMMY
                    widget.addressData?.district != null
                        ? DropdownMenuItem(
                            value: widget.addressData?.district,
                            child: Text(widget.addressData?.district ?? ''),
                          )
                        : DropdownMenuItem(
                            value: 'District 1',
                            child: Text('District 1'),
                          ),
                  ],
                  onChanged: (value) {
                    // Do something
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: addressController,
                  validator: validator,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.fullStreetAddress],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  inputFormatters: [
                    NoLeadingSpacesFormatter(),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: validator,
                  controller: postalCodeController,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.postalCode],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Postal Code',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  inputFormatters: [NoLeadingSpacesFormatter()],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: otherDetailsController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Note',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  inputFormatters: [
                    NoLeadingSpacesFormatter(),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pop();
                            Fluttertoast.showToast(
                              msg:
                                  'Address ${widget.isEdit ? 'updated' : 'saved'}',
                              gravity: ToastGravity.TOP,
                              backgroundColor: CustomColor.green,
                              textColor: Colors.white,
                            );
                          }
                        },
                        child: Text(
                          widget.isEdit ? 'Update' : 'Save',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
