import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

import '../../shared/components/text_form_field.dart';
import '../../shared/styles/response.dart';
import '../../shared/styles/standers.dart';

HttpClient createHttpClient() {
  final HttpClient client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final IOClient httpClient = IOClient(createHttpClient());

class PersonalInformation extends StatelessWidget {
  PersonalInformation({super.key});
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _fullname = TextEditingController();
    final _nickname = TextEditingController();
    final _email = TextEditingController();
    final _Country = TextEditingController();
    final _Gender = TextEditingController();
    final _address = TextEditingController();

    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: heightR(137, context),
              left: widthR(24, context),
              right: widthR(24, context),
            ),
            child: Column(
              children: [
                TextFormWidget(
                  Controller: _fullname,
                  label: 'Full Name',
                  keyboardType: TextInputType.name,
                ),
                TextFormWidget(
                  Controller: _nickname,
                  label: 'Nick name',
                  keyboardType: TextInputType.name,
                ),
                TextFormWidget(
                  Controller: _email,
                  label: 'Email',
                  keyboardType: TextInputType.name,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormWidget(
                        width_line: widthR(50, context),
                        Controller: _Country,
                        label: 'Country',
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(
                      width: widthR(10, context),
                    ),
                    Expanded(
                      child: TextFormWidget(
                        width_line: widthR(50, context),
                        Controller: _Gender,
                        label: 'Gender',
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                TextFormWidget(
                  Controller: _address,
                  label: 'Address',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: maincolor),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            var requestBody = jsonEncode({
                              'fullname': _fullname.text,
                              'nickName': _nickname.text,
                              'country': _Country.text,
                              'Gender': _Gender.text,
                              'email': _email.text,
                              'Address': _address.text,
                            });
                            var response = await httpClient.post(
                              Uri.parse(
                                'https://uswahasana.ddns.net/account/login',
                              ),
                              headers: {
                                'Content-Type': 'application/json',
                                'USKSCH':
                                    'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77'
                              },
                              body: requestBody,
                            );
                            print(response.statusCode);
                            print(response.body);

                            Map<String, dynamic> data =
                                json.decode(response.body);
                            if (response.statusCode == 200) {
                              print('Success');
                            } else if (response.statusCode == 400) {
                              print("bad Request");
                            } else {
                              print('Failed');
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ),
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeR(24, context),
                      fontWeight: FontWeight.w700),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
