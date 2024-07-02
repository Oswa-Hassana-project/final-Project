import 'package:country_picker/country_picker.dart';
import 'package:finalproject/shared/cubit/editProfileCubit.dart';
import 'package:finalproject/shared/cubit/profileStates.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  List<String> items = ['Male', 'Female'];
  var PhoneNumberController = TextEditingController(); //in cubit
  var FullNameController = TextEditingController();
  var NickNameController = TextEditingController();
  var EmailController = TextEditingController();
  var CountryController = TextEditingController(); //in cubit
  var AddressController = TextEditingController();
  var GendedrController = TextEditingController(); //in cubit
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          CountryController =cubit.CountryController;
          GendedrController =cubit.GenderController;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widthR(24, context),
                          vertical: heightR(21, context)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios),),
                            Center(
                              child: Text("Edit Profile",
                                  style:
                                  TextStyle(fontWeight: FontWeight.w700, fontSize: sizeR(22, context)),),
                            ),
                            SizedBox(width: widthR(45, context),)
                          ],
                        ),
                        SizedBox(
                          height: heightR(24, context),
                        ),
                        TextFormWidget(
                            Controller: FullNameController,
                            label: 'Full Name',
                            keyboardType: TextInputType.name,
                            radius: 8,
                            widthRe: 342,
                            heightRe: 50),
                        SizedBox(
                          height: heightR(24, context),
                        ),
                        TextFormWidget(
                            Controller: NickNameController,
                            label: 'Nick Name',
                            keyboardType: TextInputType.name,
                            radius: 8,
                            widthRe: 342,
                            heightRe: 50),
                        SizedBox(
                          height: heightR(24, context),
                        ),
                        TextFormWidget(
                            Controller: EmailController,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            radius: 8,
                            widthRe: 342,
                            heightRe: 50),
                        SizedBox(
                          height: heightR(24, context),
                        ),
                        SizedBox(
                          width: widthR(342, context),
                          height: heightR(75, context),
                          child: IntlPhoneField(
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            initialCountryCode: 'EG',
                            onChanged: (phone) {
                              if (phone.isValidNumber()) {

                                  cubit.PhoneNumberController.text = phone.completeNumber;

                              }
                            },
                            controller: PhoneNumberController,
                          ),
                        ),
                        SizedBox(
                          height: heightR(5, context),
                        ),
                        Row(
                          children: [
                            TextFormWidget(
                              Controller: cubit.CountryController,
                              label:  cubit.CCountry?? "Country",
                              keyboardType: TextInputType.name,
                              radius: 8,
                              sufIcon: Icons.arrow_drop_down_sharp,
                              widthRe: 163,
                              heightRe: 50,suffixPressed: () {
                              showCountryPicker(
                                context: context,
                                useSafeArea: true,
                                showPhoneCode: false,
                                onSelect: (Country country) {
                                  String CC=country.name.toString();
                                  cubit.ChangeCountry(CC);
                                },
                              );
                            },
                              readonly: true,
                            ),
                            SizedBox(
                              width: widthR(16, context),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: heightR(150, context),
                                      child: ListView.builder(
                                        itemCount: items.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(items[index]),
                                            onTap: () {
                                              cubit.ChangeGender(items[index]);
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: AbsorbPointer(
                                child: TextFormWidget(
                                    Controller: cubit.GenderController,
                                    label: cubit.selectedGender ?? 'Gender',
                                    keyboardType: TextInputType.emailAddress,
                                    radius: 8,
                                    widthRe: 163,
                                    heightRe: 50,
                                  readonly: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightR(24, context),
                        ),
                        TextFormWidget(
                          Controller: AddressController,
                          label: 'Address',
                          keyboardType: TextInputType.streetAddress,
                          radius: 8,
                          widthRe: 342,
                          heightRe: 50,
                        ),
                        SizedBox(
                          height: heightR(50, context),
                        ),
                        Container(
                          width: widthR(315, context),
                          height: heightR(48, context),
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(15),gradient: LinearGradient(colors: [
                            Color(0xFF1ca795),
                            Color(0xFFc2aa9f)

                          ])),
                          child: ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        
      ),

    );
  }
}
