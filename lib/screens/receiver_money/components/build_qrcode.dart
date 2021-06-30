import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

  Column buildQRCode(String data) {
    return Column(
        children: [
          Text(
          '${data}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
          SizedBox(height: 25),
          BarcodeWidget(
            color: Colors.black,
            data: "${data}",
            barcode: Barcode.qrCode(),
          ),
        ],
      );
  }