import 'package:finalproject/pages/profilepages/paypal.dart';
import 'package:finalproject/shared/styles/standers.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/response.dart';

class PaymentMethods extends StatefulWidget {
  String value;
  PaymentMethods({super.key, required this.value});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  bool? option1Checked = false;
  bool? option2Checked = false;
  late String choosed_option;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: heightR(120, context),
                width: widthR(393, context),
                decoration: BoxDecoration(
                    color: Color(0xFF16A896),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: heightR(49.2, context),
                      left: widthR(20, context),
                      right: widthR(20, context)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios_outlined)),
                        Text(
                          "Payment Methods",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sizeR(24, context),
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(Icons.search),
                      ]),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: maincolor.withOpacity(0.2),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Paypal_payment(
                            ),
                          ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.paypal,
                          color: Colors.blue,
                          size: 30,
                        ),
                        Text(
                          "PayPal",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
