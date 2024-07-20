import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/model/azkarModel.dart';

class AzkarDetailsPage extends StatefulWidget {
  final Azkar azkar;
  String title;

  AzkarDetailsPage({Key? key, required this.title, required this.azkar})
      : super(key: key);

  @override
  State<AzkarDetailsPage> createState() => _AzkarDetailsPageState();
}

class _AzkarDetailsPageState extends State<AzkarDetailsPage> {
  @override
  late List<int> remainList;

  @override
  void initState() {
    super.initState();
    remainList =
        List<int>.from(widget.azkar.array.map((item) => item.count.toInt()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: heightR(70, context)),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.azkar.array.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.black,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(sizeR(20, context)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.azkar.array[index].text,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    height: heightR(5, context),
                                  ),
                                  Text(
                                    'المتبقي: ${remainList[index]}',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    height: heightR(5, context),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: widthR(50, context),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      sizeR(30, context)),
                                              gradient: LinearGradient(colors: [
                                                Color(0xFF1ca795),
                                                Color(0xFFc2aa9f)
                                              ])),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                remainList[index] <= 0
                                                    ? remainList[index] = 0
                                                    : remainList[index]--;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizeR(15, context))),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Text(
                                                'Count',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                remainList[index] = widget
                                                    .azkar.array[index].count;
                                              });
                                            },
                                            icon: Icon(CupertinoIcons
                                                .arrow_counterclockwise))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //Text(azkar.array[0].text), // Displaying the first Azkar item's text as an example
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: heightR(100, context),
            width: widthR(393, context),
            decoration: BoxDecoration(
                color: Color(0xFF16A896),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightR(49.2, context),
                  left: widthR(20, context),
                  right: widthR(20, context)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeR(24, context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
