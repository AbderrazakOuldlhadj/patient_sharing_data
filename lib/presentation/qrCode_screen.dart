import 'package:flutter/material.dart';
import 'package:patient_data/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/images/doctor.jpg", fit: BoxFit.cover),
        ),
        const Positioned(
          top: 40,
          left: 16,
          child: Icon(Icons.arrow_back),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            //color: Theme.of(context).primaryColor.withOpacity(.5),
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 100),
                QrImage(
                  data: "Anonymous data $number",
                  size: 200,
                ),
                largeVerticalSpace,
                largeVerticalSpace,
                largeVerticalSpace,
                ElevatedButton(
                  onPressed: () => setState(() => number++),
                  child: const Text("Generate"),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
