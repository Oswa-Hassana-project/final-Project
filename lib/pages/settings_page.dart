import 'package:flutter/material.dart';
import 'package:finalproject/shared/cubit/editProfileCubit.dart';
import 'package:finalproject/shared/cubit/profileStates.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit,ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProfileCubit cubit = ProfileCubit.get(context);

            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: heightR(24, context), ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: widthR(19, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('App Settings',style: TextStyle(fontSize: sizeR(22, context),fontWeight: FontWeight.w700),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: widthR(28, context),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: heightR(19, context),),
                                Text('Common',style: TextStyle(fontSize: sizeR(16, context),fontWeight: FontWeight.bold),),
                                SizedBox(height: heightR(12, context),),
                                NotificationsSitting("General Notification",cubit.switchValueGeneral,(value) => cubit.ToggleSwitch(value) ,context),
                                SizedBox(height: heightR(12,context),),
                                NotificationsSitting("Sound", cubit.switchValueSound,(value) => cubit.ToggleSwitchSound(value) ,context),
                                SizedBox(height: heightR(12, context),),
                                NotificationsSitting("Vibrate", cubit.switchValueVibrate,(value) => cubit.ToggleSwitchVibrate(value),context),
                                SizedBox(height: heightR(12, context),),
                                NotificationsSitting("Prayer Times Reminder", cubit.switchValuePrayer,(value) => cubit.ToggleSwitchPrayer(value),context),
                                SizedBox(height: heightR(29, context),),
                                Divider(color: Color(0xFFeeeeee)),
                                SizedBox(height: heightR(18, context),),
                                Text('System & services update',style: TextStyle(fontSize: sizeR(16, context),fontWeight: FontWeight.bold),),
                                SizedBox(height: heightR(16, context),),
                                NotificationsSitting("App updates", cubit.switchValueAppUpdate,(value) => cubit.ToggleSwitchAppUpdate(value),context),
                                SizedBox(height: heightR(14, context),),
                                NotificationsSitting("Promotion", cubit.switchValuePromotion,(value) => cubit.ToggleSwitchPromotion(value),context),
                                SizedBox(height: heightR(14, context),),
                                NotificationsSitting("Discount Available", cubit.switchValueDiscount,(value) => cubit.ToggleSwitchDiscount(value),context),
                                SizedBox(height: heightR(14, context),),
                                NotificationsSitting("Payment Request", cubit.switchValuePayment,(value) => cubit.ToggleSwitchPayment(value),context),
                                SizedBox(height: heightR(55, context),),
                                Divider(color: Color(0xFFeeeeee)),
                                Text('Others',style: TextStyle(fontSize: sizeR(16, context),fontWeight: FontWeight.bold),),
                                SizedBox(height: heightR(8, context),),
                                NotificationsSitting("New Service Available", cubit.switchValueService,(value) => cubit.ToggleSwitchService(value),context),
                                SizedBox(height: heightR(12, context),),
                                NotificationsSitting("New Tips Available", cubit.switchValueTips,(value) => cubit.ToggleSwitchTips(value),context),












                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )  ),


            );

          },
        )
    );
  }
  Widget NotificationsSitting(String title,bool state,Function(bool) onChanged,context){
    return Container(
      height: heightR(20, context),
      child: Row(
        children: [
          Container(
              width: widthR(220, context),
              height: heightR(20, context),
              child: Text(title,style: TextStyle(fontSize: sizeR(14, context)),)),
          SizedBox(width: widthR(53, context),),
          Transform.scale(
            scale: sizeR(0.8, context),
            child: Switch(value: state, activeTrackColor: Color(0xff13a795),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[300],
                trackOutlineColor: MaterialStatePropertyAll(Colors.transparent),
                onChanged: onChanged
            ),
          ),
        ],
      ),
    );
  }

}
