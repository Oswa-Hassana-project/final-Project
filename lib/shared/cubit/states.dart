import 'package:finalproject/model/dataModel.dart';
import 'package:finalproject/shared/cubit/states.dart';

abstract class AppStates {}

class AppInitalState extends AppStates {}
class PasswordShow extends AppStates{}
class LoadingAppState extends AppStates{}
class LoadAzanTimeState extends AppStates{
  final List<TimeAzanModel> AzanTime;
  LoadAzanTimeState(this.AzanTime);
}
class ErrorAppState extends AppStates{
  final String massage;
  ErrorAppState(this.massage);
}
class AppTimeNow extends AppStates{

}

