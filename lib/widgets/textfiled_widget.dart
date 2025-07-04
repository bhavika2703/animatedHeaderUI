import 'package:flutter/material.dart';
import 'package:prectice0702/ui/global.dart';
import 'package:prectice0702/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  TextFieldWidget({
    required this.hintText,
    required this.prefixIconData,
    this.suffixIconData,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Global.mediumPurple,
      style: TextStyle(color: Global.mediumPurple, fontSize: 14.0),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Global.mediumPurple),
        focusColor: Global.mediumPurple,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.mediumPurple),
        ),
        labelText: hintText,
        prefixIcon: Icon(prefixIconData, size: 18, color: Global.mediumPurple),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(suffixIconData, size: 18, color: Global.mediumPurple),
        ),
      ),
    );
  }
}
