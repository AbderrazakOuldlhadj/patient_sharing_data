// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget MyTextField(
  context, {
  required TextEditingController controller,
  String? label,
  String? hintText,
  bool readOnly = false,
  VoidCallback? onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black38),
          /*label: Text(
            label ?? "",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),*/
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none),
    ),
  );
}

Widget SharingType(IconData icon, String label, [VoidCallback? onTap]) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 80),
        smallVerticalSpace,
        Text(label),
      ],
    ),
  );
}

Future? qrCodeDialog(context) {
  return showDialog(
    context: context,
    builder: (cx) {
      return Dialog(
        backgroundColor: const Color(0xFFFAFAFA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            largeVerticalSpace,
            QrImage(
              data: "Anonymous data ",
              size: 200,
            ),
            largeVerticalSpace,
          ],
        ),
      );
    },
  );
}

Future acceptDialog(context) {
  bool isChecked = false;
  var controller = TextEditingController();
  return showDialog(
    context: context,
    builder: (cx) {
      return AlertDialog(
        backgroundColor: const Color(0xFFFAFAFA),
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sharing Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                largeVerticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SharingType(
                      Icons.qr_code_2,
                      "Qr Code",
                      () async {
                        Navigator.pop(cx);
                        qrCodeDialog(context);
                      },
                    ),
                    SharingType(
                      Icons.nfc,
                      "NFC",
                    ),
                  ],
                ),
                largeVerticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SharingType(
                      Icons.file_upload_outlined,
                      "Upload File",
                    ),
                    SharingType(
                      Icons.link,
                      "Provide a link",
                    ),
                  ],
                ),
                largeVerticalSpace,
                StatefulBuilder(
                  builder: (context, set) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.18),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Checkbox(
                                value: isChecked,
                                activeColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide.none,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) {
                                  set(() => isChecked = value!);
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Expanded(
                              child: Text(
                                  "Allow my Data to be stored by this Doctor"),
                            ),
                          ],
                        ),
                        if (isChecked) ...[
                          mediumVerticalSpace,
                          MyTextField(
                            context,
                            controller: controller,
                            label: "Expiration Date",
                            hintText: "M/d/Y",
                            readOnly: true,
                            onTap: () async {
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (date != null) {
                                set(() => controller.text =
                                    DateFormat.yMd().format(date));
                              }
                            },
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
