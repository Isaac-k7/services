import 'package:flutter/material.dart';

import '../config/constants.dart';

class TextForm extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final IconData? icon;
  final VoidCallback? onPressIcon;
  final String? labelText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool readOnly;
  final  String? hintText;
  final  int maxLines;

  const TextForm({
    this.initialValue,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.icon,
   this.onPressIcon,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.readOnly = false,
    this.hintText,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(
        // color: BigCityColors.kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: TextFormField(
        
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color.fromARGB(68, 208, 207, 207),
          suffixIcon: IconButton(
            onPressed: onPressIcon,
            icon: Icon(icon),
          ),
          labelText: labelText,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.kPrimaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        obscureText: obscureText,
        readOnly: readOnly,
      ),
    );
  }
}
