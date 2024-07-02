
import '../../model/quran_model.dart';

abstract class quranState{}

class InitQuranState extends quranState{}
class LoadingQuranState extends quranState{}
class ErrorQuranState extends quranState{
  final  String message;
  ErrorQuranState(this.message);
}
class ResponseQuranState extends quranState{
    final  List<QuranModel> qurans;
   ResponseQuranState(this.qurans);
}