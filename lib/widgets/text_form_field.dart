import 'package:finalproject/services/focusnode.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
      required this.Controller,
      required this.label,
      required this.keyboardType,
      this.preIcon,
      this.sufIcon,
      this.ispassword = false,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.suffixPressed,
      this.maxLine,
      this.radius,
      this.widthRe,
      this.heightRe,
      this.readonly = false,
      this.minLine});

  final TextEditingController Controller;
  final String label;
  final bool ispassword;
  final bool readonly;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;
  final Function()? suffixPressed;
  final IconData? preIcon;
  final IconData? sufIcon;
  final TextInputType? keyboardType;
  final int? maxLine;
  final int? minLine;
  final double? radius;

  final double? widthRe;

  final double? heightRe;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthRe != null ? widthR(widthRe!, context) : null,
      height: heightRe != null ? widthR(heightRe!, context) : null,
      child: TextFormField(
        maxLines: maxLine ?? 1,
        minLines: minLine,
        keyboardType: keyboardType,
        validator: validator,
        autovalidateMode:
            validator != null ? AutovalidateMode.onUserInteraction : null,
        controller: Controller,
        obscureText: ispassword,
        decoration: InputDecoration(

          label: Text(
            label,
            style: TextStyle(
                fontSize: sizeR(15, context),
                color: Color(0xff80000000),
                fontWeight: FontWeight.bold),
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 17))),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: preIcon != null ? Icon(preIcon) : null,
          ),
          prefixIconConstraints:BoxConstraints.tightFor() ,
          suffixIcon: sufIcon != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(sufIcon))
              : null,
        ),
        readOnly: readonly ==true ? true : false  ,
        focusNode: readonly ==true ? FocusNNN() : null ,
        enableInteractiveSelection: readonly ==true ? false : true  ,

      ),
    );
  }
}
