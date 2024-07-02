import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

import '../../shared/constant/paypal_constants.dart';

class Paypal_payment extends StatefulWidget {
  const Paypal_payment({super.key});


  @override
  State<Paypal_payment> createState() => _Paypal_paymentState();
}

class _Paypal_paymentState extends State<Paypal_payment> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal Integration Example'),
      ),
      body: UsePaypal(
          sandboxMode: true,
          clientId: "${Constants.clientId}",
          secretKey: "${Constants.secretKey}",
          returnURL: "${Constants.returnURL}",
          cancelURL: "${Constants.cancelURL}",
          transactions: const [
            {
              "amount": {
                "total": '1',
                "currency": "USD",
                "details": {
                  "subtotal": '10.12',
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description":
              "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": {
                "items": [
                  {
                    "name": "A demo product",
                    "quantity": 1,
                    "price": '10.12',
                    "currency": "USD"
                  }
                ],

                // shipping address is not required though
                "shipping_address": {
                  "recipient_name": "Jane Foster",
                  "line1": "Travis County",
                  "line2": "",
                  "city": "Austin",
                  "country_code": "US",
                  "postal_code": "75462",
                  "phone": "+00000000",
                  "state": "Texas"
                },
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
          },
          onCancel: (params) {
            print('cancelled: $params');
          }),
    );
  }
}
