import 'dart:convert';
import 'package:http/io_client.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import '../shared/components/text_form_field.dart';
import '../shared/styles/response.dart';

HttpClient createHttpClient() {
  final HttpClient client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final IOClient httpClient = IOClient(createHttpClient());

class Forget_password extends StatefulWidget {
  const Forget_password({super.key});

  @override
  State<Forget_password> createState() => _Forget_passwordState();
}

class _Forget_passwordState extends State<Forget_password> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: heightR(241, context),
                  width: widthR(217, context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/forgetpassword.png")),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    'Please Enter your email and wait  \n       the link to reset password'),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  child: TextFormWidget(
                    Controller: _email,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    preIcon: Icons.message,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            var requestBody = jsonEncode({
                              'email': _email.text,
                            });
                            var response = await httpClient.post(
                              Uri.parse(
                                'https://192.168.1.100:3000/account/ForgetPassword',
                              ),
                              headers: {
                                'Content-Type': 'application/json',
                                'USKSCH':
                                    'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77' // Set the content type to JSON
                              },
                              body: requestBody,
                            );
                            print(response.statusCode);
                            print(response.body);

                            Map<String, dynamic> data =
                                json.decode(response.body);
                            print(data['token']);
                            if (response.statusCode == 200) {
                              print('Success');
                            } else if (response.statusCode == 400) {
                              print("bad requist");
                            } else {
                              print('Failed');
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                        // print(_email.text);
                        // print(_password.text);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff004038),
                          fixedSize: Size(double.maxFinite, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
                      child: Text(
                        "SEND",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
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
                        "Forget Password",
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
      ),
    );
  }
}
