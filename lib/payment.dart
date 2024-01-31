import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:payment/widgets/webview.dart';
import 'payment_platform_interface.dart';
import 'package:http/http.dart' as http;

class PaymentWidget extends StatefulWidget {
  final String sparkProvisioningIdentifier;
  const PaymentWidget({Key? key, required this.sparkProvisioningIdentifier});

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late String transactionId;

  Future<void> sendPostRequest() async {
    transactionId = '240126160355738024';
    var refno = DateTime.now().millisecondsSinceEpoch.toString();

    var payload = jsonEncode({
      'redirect': {
        'successUrl': "successUrl",
        'errorUrl': "errorUrl",
        'cancelUrl': "cancelUrl"
      },
      'refno': refno,
      'amount': 2000,
      'currency': 'CHF'
    });

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic MTEwMDAyNTgzNTozY29mTjNNeFhhQkg3VWw4',
      'Host': 'api.sandbox.datatrans.com',
    };

    try {
      var response = await http.post(
        Uri.parse('https://api.sandbox.datatrans.com/v1/transactions'),
        headers: headers,
        body: payload,
      );

      if (response.statusCode == 201) {
        print('Response data: ${response.body}');
        print(response.body);
        transactionId = response.body;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // final response = http.get(url);
    // sendPostRequest();
    transactionId = '240126161244431407';
  }

  @override
  Widget build(BuildContext context) {
    return AsPaymentWebview(
      transactionId: transactionId,
    );
  }
}
