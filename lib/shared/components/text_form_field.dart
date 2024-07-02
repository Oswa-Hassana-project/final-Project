
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
        required this.Controller,
        required this.label,
        required this.keyboardType,
        this.preIcon,
        this.sufIcon,
        this.width_line,
        this.ispassword=false,
        this.validator,
        this.maxLine,
        this.minLine,
        this.width,
      });

  final TextEditingController Controller;
  final String label;
  final bool ispassword;
  final String? Function(String?)? validator;
  final IconData? preIcon;
  final IconData? sufIcon;
  final TextInputType? keyboardType;
  final int? maxLine;
  final double? width_line;
  final int? minLine;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Container(
            height: 5,
            width: width_line ?? 0.5*MediaQuery.of(context).size.width,

          ),
          Container(
            width: width ,
            child: TextFormField(
              maxLines:maxLine ?? 1 ,
              minLines: minLine,
              keyboardType: keyboardType,
              validator: validator,
              autovalidateMode:
              validator != null ? AutovalidateMode.onUserInteraction : null,
              controller: Controller,
              obscureText: ispassword,
              decoration:
              InputDecoration(label: Text(label,style: TextStyle(fontSize: 16,
                  color: Color(0xff80000000),fontWeight: FontWeight.bold),),
                fillColor: Colors.white,
                filled: true,
                border:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon:Icon(preIcon,color: Color(0xff80000000),),
                suffixIcon: sufIcon != null ? Icon(sufIcon):null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
