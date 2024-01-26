
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:payment/widgets/webview.dart';
import 'payment_platform_interface.dart';
import 'package:http/http.dart' as http;

class PaymentWidget extends StatefulWidget {
  final String sparkProvisioningIdentifier;
  const PaymentWidget({ Key? key, required this.sparkProvisioningIdentifier });

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late String transactionId;

  // TODO: replace with GET transactionId from as-payment service
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  @override
  void initState() {
    final response = http.get(url);
    transactionId = '240126151215045171';
  }

  @override
  Widget build(BuildContext context) {
    return AsPaymentWebview(transactionId: transactionId,);
  }
}