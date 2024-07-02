import 'package:bloc/bloc.dart';
import 'package:finalproject/pages/chatPage.dart';
import 'package:finalproject/pages/contact_us.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/settings_page.dart';
import 'package:finalproject/shared/cubit/nav_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<NavCubitState> {
  NavCubit(): super(NavInitialState());
  static NavCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;

  List<Widget> bottomItems = [
    Icon(CupertinoIcons.settings,color: Color(0xff13a795),),
    Icon(Icons.home,color: Color(0xff13a795),),
    Icon(Icons.contact_support,color: Color(0xff13a795))
  ];

  List<Widget> Screens=[
    SettingsPage(),
    homepage(),
    ContactUs()

  ];
  void changeBottomNavBar(int index){
    currentIndex= index;
    emit(BottomNavState());
  }
}