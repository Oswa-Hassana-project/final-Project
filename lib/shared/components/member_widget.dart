import 'package:flutter/material.dart';

import '../../widgets/constsnts.dart';

class Members_widget extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  const Members_widget(
      {super.key,
      required this.name,
      required this.phone,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
              horizontal: 25
              ),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all()),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name : ${name}"),
                          Text("phone : ${phone}"),
                          Text("Email : ${email}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ],
    );
  }
}
