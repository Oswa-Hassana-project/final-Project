import 'package:flutter/material.dart';

import '../shared/components/member_widget.dart';
import '../widgets/constsnts.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 150
            ),
            child: Column(
              children: [
                Members_widget(name: 'Mohamed Omar', phone: '01550135836', email: 'mg.omar.ok@gmail.com'                       ,),
                Members_widget(name: 'Mohamed Abdullah', phone: '01060772456', email: 'ma1348744@gmail.com             ',),
                Members_widget(name: 'Ahmed Sabaa', phone: '010608557077', email: 'Ahmedsabaa65@gmail.com             ',),
                Members_widget(name: 'Ahmed Hazem', phone: '01120444299', email: 'ah2065691@gmail.com                 ',),
                Members_widget(name: 'ِAli Yasser', phone: '01002003430', email: 'Aliyasser1615@gmail.com              ',),
                Members_widget(name: 'Mustafa Yasser', phone: '01027763735', email: 'mustafayasserhosny@gmail.com',),

              ],
            ),
          ),
          Container(
            height: heightR(100, context),
            width: widthR(393, context),
            decoration: BoxDecoration(
                color: Color(0xFF16A896),
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightR(49.2, context),
                  left: widthR(20, context),
                  right: widthR(20, context)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "Developers",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeR(24, context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
