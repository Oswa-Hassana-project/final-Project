import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:finalproject/model/azkarModel.dart';
import 'package:finalproject/shared/cubit/azkarStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/model/loadAzkar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AzkarCubit extends Cubit<AzkarStates>{
  final LoadAzkarData loadData;
  AzkarCubit(this.loadData) : super(AppInitalState());

  static AzkarCubit get(context)=> BlocProvider.of(context);
  List<Azkar> allData = [];
  List<Azkar> savedData = [];
  List<bool> isBookmarked = [];



  Future<void> loadJsonData() async {
    try {
      emit(LoadingAppState());
      final AzkarData = await loadData.GetAzkData() ;
      allData = List<Azkar>.from(AzkarData);
      isBookmarked = List.generate(AzkarData.length, (_) => false);
      await _loadBookmarks();
      emit(BookIconToggle());
      emit(LoadAzkarState(allData));

    }catch (e) {
      print(e.toString());
      emit(ErrorAppState( e.toString()));
    }
  }

  Future<void> _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var azkar in allData) {
      azkar.isBookmarked = prefs.getBool('bookmark_${azkar.id}') ?? false;
      if (azkar.isBookmarked) {
        savedData.add(azkar);
      }
    }
  }
  Future<void> _saveBookmark(Azkar azkar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bookmark_${azkar.id}', azkar.isBookmarked);
    print("add${azkar.id}");
  }

  Future<void> _removeBookmark(Azkar azkar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('bookmark_${azkar.id}');
    print("remove${azkar.id}");
  }


  // void toggleBookmark(int index) async {
  //   if (state is LoadAzkarState) {
  //     List<Azkar> allData = List.from((state as LoadAzkarState)
  //         .GetAzkar); // Make a copy of the current Azkar list
  //     if (index >= 0 && index < allData.length) {
  //       allData[index].isBookmarked = !allData[index].isBookmarked;
  //       allData[index].isBookmarked = isBookmarked[index];
  //       emit(LoadAzkarState(allData));
  //       if (allData[index].isBookmarked) {
  //         savedData.add(allData[index]);
  //       } else {
  //         savedData.removeWhere((element) => element.id == allData[index].id);
  //       }
  //       await _saveBookmark(allData[index]);
  //       emit(LoadAzkarState(
  //           List.from(allData))); // Emit updated state with the modified list
  //       print(isBookmarked);
  //     }
  //   }
  // }
  void toggleBookmark(int index) async{
    if (state is LoadAzkarState) {
    List<Azkar> updatedAzkarList = List.from((state as LoadAzkarState).GetAzkar); // Make a copy of the current Azkar list
    if (index >= 0 && index < updatedAzkarList.length) { // Ensure index is valid
    isBookmarked[index] = !isBookmarked[index];
    updatedAzkarList[index].isBookmarked = isBookmarked[index]; // Update the bookmark status for the specified index
    emit(LoadAzkarState(updatedAzkarList)); // Emit the updated state with the modified list
    if (updatedAzkarList[index].isBookmarked) {
    savedData.add(updatedAzkarList[index]);
    } else {
    savedData.removeWhere(
    (element) => element.id == updatedAzkarList[index].id);
    await _removeBookmark(updatedAzkarList[index]);
        }
        allData=updatedAzkarList;
        await _saveBookmark(allData[index]);
        emit(LoadAzkarState(
                      List.from(allData)));
        print(_saveBookmark);
      }
    }
  }
  void toggleBookmarkByAzkar(Azkar azkar) async {
    azkar.isBookmarked = !azkar.isBookmarked;
    if (azkar.isBookmarked) {
      savedData.add(azkar);
    } else {
      savedData.removeWhere((element) => element.id == azkar.id);
    }
    await _saveBookmark(azkar);
    emit(LoadAzkarState(List.from(allData)));
  }
  void removeBookmark(Azkar azkar) async {
    azkar.isBookmarked = false;

    savedData.removeWhere((element) => element.id == azkar.id);
    await _saveBookmark(azkar);
    emit(LoadAzkarState(List.from(allData)));

  }

  bool isBook=false;
  void ToggleIsbook (){
    isBook =!isBook;
    loadJsonData();
  }
}