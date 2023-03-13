import 'package:flutter/material.dart';
import 'package:try_firbs/helpers/myApplication.dart';

class CustomPhoneTextField extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? prefix;
  final suffix;
  final bool? obscureTxt;
  final String? Function(String?)? validator;
  final keyBoardType;
  final TextEditingController? controller;
  final clr;
  final maxLines;
  final minLines;
  final maxlenth;
  final enabled;
  const CustomPhoneTextField(
      {Key? key,
      this.hint,
      this.label,
      this.prefix,
      this.suffix,
      this.obscureTxt,
      this.validator,
      this.keyBoardType,
      this.controller,
      this.clr,
      this.maxLines,
      this.minLines,
      this.maxlenth,
      this.enabled})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: myApplication.hightClc(context, 5),
        ),
        Text(
          label ?? "",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary.withOpacity(.8),
              fontSize: 14),
        ),
        SizedBox(
          height: myApplication.hightClc(context, 5),
        ),
        CustomPhoneTextField(
          controller: controller,
          hint: hint,
          prefix: prefix,
          suffix: suffix,
          validator: validator,
          obscureTxt: obscureTxt,
          keyBoardType: keyBoardType,
          clr: clr,
          maxLines: maxLines,
          minLines: minLines,
          maxlenth: maxlenth,
          enabled: enabled,
        ),
      ],
    );
  }
}
