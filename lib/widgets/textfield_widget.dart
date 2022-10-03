import 'package:authentication/util/dimensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Icon? preFixIcon;
  final Icon? suffixIcon;

  const AppTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.preFixIcon,
    this.suffixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(1, 10),
                  blurRadius: 10,
                  spreadRadius: 6
              )
            ]
        ),
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            prefix: preFixIcon,
            suffix: suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.white
                )
            ),
          ),
        )
    );
  }
}