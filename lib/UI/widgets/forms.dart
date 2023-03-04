import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';

class CustomFormField extends StatelessWidget {
  final String? title;
  final bool? obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyBoardType;
  const CustomFormField(
      {super.key,
      required this.title,
      this.obscureText = false,
      this.controller,
      this.isShowTitle = true,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          keyboardType: keyBoardType,
          controller: controller,
          obscureText: obscureText!,
          decoration: InputDecoration(
              hintText: isShowTitle ? '' : title,
              contentPadding: const EdgeInsets.all(12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        )
      ],
    );
  }
}

class CustomDropDownFormFilled extends StatefulWidget {
  List<dynamic> listOfValue;
  dynamic? values;
  final dynamic? title;
  CustomDropDownFormFilled(
      {super.key, required this.title, this.values, required this.listOfValue});

  @override
  State<CustomDropDownFormFilled> createState() =>
      _CustomDropDownFormFilledState();
}

class _CustomDropDownFormFilledState extends State<CustomDropDownFormFilled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(
          height: 12,
        ),
        DropdownButtonFormField(
          value: widget.values,
          isExpanded: true,
          onChanged: (dynamic value) {
            setState(() {
              widget.values = value;
            });
          },
          decoration: InputDecoration(
              focusColor: greenColor,
              contentPadding: const EdgeInsets.all(12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          onSaved: (dynamic value) {
            setState(() {
              widget.values = value;
            });
          },
          items: widget.listOfValue.map((dynamic val) {
            return DropdownMenuItem(
              value: val,
              child: Text(
                val,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
