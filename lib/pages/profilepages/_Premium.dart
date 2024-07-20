import 'package:finalproject/pages/profilepages/payment_methods.dart';
import 'package:finalproject/shared/styles/standers.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/response.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
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
                          "Premium",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sizeR(24, context),
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.search,
                          color: maincolor,
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                              color: maincolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  '25 ردود باليوم  ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  textDirection: TextDirection.rtl,
                                ),
                                CheckboxListTile(
                                  title: Text(
                                    " \$1",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: option1Checked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      option1Checked = newValue;
                                      if (newValue == true) {
                                        option2Checked = false;
                                        choosed_option = " \$1";
                                      }
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity
                                      .leading, //  <-- leading Checkbox
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                            color: maincolor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'عدد لا نهائي من الردود  ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textDirection: TextDirection.rtl,
                              ),
                              CheckboxListTile(
                                title: Text(
                                  "\$5",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                value: option2Checked,
                                onChanged: (newValue) {
                                  setState(() {
                                    option2Checked = newValue;
                                    if (newValue == true) {
                                      option1Checked = false;
                                      choosed_option = " \$5";
                                    }
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            print(choosed_option);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentMethods(
                                  value: choosed_option,
                                ),
                              ),
                            );
                          },
                          child: Text('Continue To Pay')),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
