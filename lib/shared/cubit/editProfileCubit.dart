import 'package:bloc/bloc.dart';
import 'package:finalproject/shared/cubit/profileStates.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(AppInitalState());

  static ProfileCubit get(context)=> BlocProvider.of(context);

  String? CCountry=null;
  String? selectedGender=null;
  var GenderController = TextEditingController();
  var CountryController = TextEditingController();
  var PhoneNumberController = TextEditingController();

  phoneNumber(String Phone){
    PhoneNumberController.text=Phone;
    emit(GetPhoneState());
  }
  ChangeCountry(String Country){
    CCountry =Country;
    CountryController.text =Country;
    emit(GetCountryState());
  }
  ChangeGender(String Gender){
    selectedGender =Gender;
    GenderController.text=Gender;
    emit(GetGenderState());
  }

  bool switchValueGeneral=true;
  bool switchValueSound=true;
  bool switchValueVibrate=true;
  bool switchValuePrayer=true;
  bool switchValueAppUpdate=true;
  bool switchValuePromotion=true;
  bool switchValueDiscount=true;
  bool switchValuePayment=true;
  bool switchValueService=true;
  bool switchValueTips=true;

  ToggleSwitch(bool value){
    switchValueGeneral=value;
    emit(NotificationsState());
  }
  ToggleSwitchSound(bool value){
    switchValueSound=value;
    emit(NotificationsState());
  }
  ToggleSwitchVibrate(bool value){
    switchValueVibrate=value;
    if(value==true){
      vibrateDevice();
      Vibration.vibrate(duration: 100);
    }else{
      cancelVibration();
    }
    emit(NotificationsState());
  }
  ToggleSwitchPrayer(bool value){
    switchValuePrayer=value;
    emit(NotificationsState());
  }
  ToggleSwitchAppUpdate(bool value){
    switchValueAppUpdate=value;
    emit(NotificationsState());
  }
  ToggleSwitchPromotion(bool value){
    switchValuePromotion=value;
    emit(NotificationsState());
  }
  ToggleSwitchDiscount(bool value){
    switchValueDiscount=value;
    emit(NotificationsState());
  }
  ToggleSwitchPayment(bool value){
    switchValuePayment=value;
    emit(NotificationsState());
  }
  ToggleSwitchService(bool value){
    switchValueService=value;
    emit(NotificationsState());
  }
  ToggleSwitchTips(bool value){
    switchValueTips=value;
    emit(NotificationsState());
  }
  void cancelVibration() {
    if (Vibration.hasVibrator() != null) {
      Vibration.cancel();
    }
  }
  void vibrateDevice() {
    if (Vibration.hasVibrator() != null) {
      Vibration.vibrate();
    }
  }

}