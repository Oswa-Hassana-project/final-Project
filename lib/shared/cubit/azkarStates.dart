import 'package:finalproject/model/azkarModel.dart';

abstract class AzkarStates {}
class AppInitalState extends AzkarStates {}
class LoadingAppState extends AzkarStates{}
class LoadAzkarState extends AzkarStates{
  final List<Azkar> GetAzkar;
  LoadAzkarState(this.GetAzkar);
}
class ErrorAppState extends AzkarStates{
  final String massage;
  ErrorAppState(this.massage);
}
class BookIconToggle extends AzkarStates{

}

