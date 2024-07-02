import 'package:finalproject/model/loadAzkar.dart';
import 'package:finalproject/pages/azkarDetailsPage.dart';
import 'package:finalproject/shared/cubit/azkarCubit.dart';
import 'package:finalproject/shared/cubit/azkarStates.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedAzkar extends StatefulWidget {
  SavedAzkar({super.key, required this.cubit });

  final AzkarCubit cubit;

  @override
  State<SavedAzkar> createState() => _SavedAzkarState();
}

class _SavedAzkarState extends State<SavedAzkar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(LoadAzkarData())..loadJsonData(),
      child: BlocConsumer<AzkarCubit,AzkarStates>(builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthR(14, context),
                    vertical: heightR(17, context)),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios),),
                          Text(
                            'الأذكار المحفوظه',
                            style: TextStyle(fontSize: sizeR(24, context)),
                          ),
                          SizedBox(width: widthR(24, context),),
                        ],
                      ),SavedBody()
                    
                  
                    ],
                  ),
                ),
              ),
            ));
      }, listener: (context, state) {},),
    );
  }
  Widget SavedBody()  {
    if(widget.cubit.savedData.isEmpty){
      return Expanded(child: Center(child: Text('لايوجد أذكار محفوظه'),));
    }else{
      return Expanded(
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.cubit.savedData.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  AzkarDetailsPage(title: widget.cubit.savedData[index].category,azkar: widget.cubit.savedData[index]),));
                },
                child: AzkarWidget(widget.cubit.savedData[index].category,index,widget.cubit.savedData[index].isBookmarked, context,onBookmarkToggle: () {
                  widget.cubit.toggleBookmarkByAzkar(widget.cubit.savedData[index]);
                  setState(() {});
                },));
          },),
      );

  }
  }
}
