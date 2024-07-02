import 'package:finalproject/shared/cubit/quran_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/quran_repository.dart';


class QuranCubit extends Cubit<quranState>{
  final QuranRepository _repository;
  QuranCubit(this._repository) : super(InitQuranState());

  Future<void> fetchQuran() async {
    emit(LoadingQuranState());
    try{
      final response = await _repository.getAll();
      emit(ResponseQuranState(response));
    }catch(e){
      // throw Exception("error in here ");
      emit(ErrorQuranState(e.toString()));
      print(e.toString());
    }

  }


}