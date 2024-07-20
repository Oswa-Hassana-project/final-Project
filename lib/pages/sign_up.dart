import 'package:finalproject/model/repositories.dart';
import 'package:finalproject/shared/cubit/cubit.dart';
import 'package:finalproject/shared/cubit/states.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';

HttpClient createHttpClient() {
  final HttpClient client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final IOClient httpClient = IOClient(createHttpClient());

class sign_up extends StatefulWidget {
  sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  var firstnameController = TextEditingController();
  var midController = TextEditingController();
  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conf_passControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppCubit(TimeRepository()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: heightR(40, context),
                    horizontal: widthR(29, context)),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/logo/اسوه حسنه1.png"),
                        width: 110,
                        height: 110,
                      ),
                      Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: TextFormWidget(
                                keyboardType: TextInputType.name,
                                label: "First Name",
                                Controller: firstnameController,
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return 'Please Enter first name';
                                  }
                                  return null;
                                },
                                preIcon: Icons.person,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: widthR(17, context),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: TextFormWidget(
                                keyboardType: TextInputType.name,
                                label: "Mid Name",
                                Controller: midController,
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return 'Please Enter Middle Name';
                                  }
                                  return null;
                                },
                                preIcon: Icons.person,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: heightR(14, context),
                      ),
                      TextFormWidget(
                        keyboardType: TextInputType.name,
                        label: "Last Name",
                        Controller: lastController,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Please Enter Last Name';
                          }
                          return null;
                        },
                        preIcon: Icons.person,
                      ),
                      SizedBox(
                        height: heightR(14, context),
                      ),
                      TextFormWidget(
                        keyboardType: TextInputType.emailAddress,
                        label: "Email",
                        Controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          }
                          // Use a regular expression to validate the email format
                          final emailRegExp =
                              RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                          if (!emailRegExp.hasMatch(value)) {
                            return 'Not a valid email address. Should be your@email.com';
                          }
                          return null;
                        },
                        preIcon: Icons.email,
                      ),
                      SizedBox(
                        height: heightR(14, context),
                      ),
                      TextFormWidget(
                        keyboardType: TextInputType.visiblePassword,
                        label: "Password",
                        Controller: passwordController,
                        ispassword: cubit.isPassword,
                        sufIcon: cubit.isPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        suffixPressed: () {
                          cubit.PasswordIsShow();
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Password is required';
                          } else if (passwordController.text !=
                              conf_passControler.text) {
                            passconfirm(false);
                          }
                          return null;
                        },
                        preIcon: Icons.lock,
                      ),
                      FlutterPwValidator(
                        width: 400,
                        height: 150,
                        minLength: 8,
                        numericCharCount: 2,
                        uppercaseCharCount: 1,
                        specialCharCount: 1,
                        onSuccess: () {},
                        controller: passwordController,
                      ),
                      SizedBox(
                        height: heightR(14, context),
                      ),
                      TextFormWidget(
                        keyboardType: TextInputType.visiblePassword,
                        label: "Confirm Password",
                        Controller: conf_passControler,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'must confirm password is required';
                          } else if (passwordController.text !=
                              conf_passControler.text) {
                            return passconfirm(false);
                          }
                          return null;
                        },
                        ispassword: cubit.isPassword,
                        sufIcon: cubit.isPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        suffixPressed: () {
                          cubit.PasswordIsShow();
                        },
                        preIcon: Icons.lock,
                      ),
                      SizedBox(
                        height: heightR(14, context),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                var requestBody = jsonEncode({
                                  'data': {
                                    'firstname': firstnameController.text,
                                    'middlename': midController.text,
                                    'lastname': lastController.text,
                                    'email': emailController.text,
                                    'password': passwordController.text
                                  }
                                });
                                var response = await httpClient.post(
                                  Uri.parse(
                                    'https://192.168.1.100:3000/account/createUserAccount',
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
                                // Map<String, dynamic> data =
                                // json.decode(response.body);
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
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff004038),
                              fixedSize:
                                  Size(double.maxFinite, sizeR(48, context)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      sizeR(17, context)))),
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: heightR(26, context),
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an Account?",
                            style: TextStyle(
                                color: Color(0xff004038),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: widthR(5, context),
                          ),
                          InkWell(
                              onTap: () {},
                              child: Text(
                                "Sign in",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  String? passconfirm(value) {
    if (value == true) {
      return null;
    } else {
      return "Password Not similar";
    }
  }
}
