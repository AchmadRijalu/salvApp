import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/common.dart';

class ProfileMenu extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? ontap;
  const ProfileMenu(
      {super.key, required this.iconUrl, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(children: [
          SvgPicture.asset(
            iconUrl,
            width: 24,
            color: Colors.black,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )
        ]),
      ),
    );
  }
}
