import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';

class CustomFilledButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;

  final VoidCallback? onPressed;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: greenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: onPressed,
          child: Text(
            title!,
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;

  final VoidCallback? onPressed;
  const CustomTextButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 19,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Text(
          title!,
          style: greenTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
