import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salv/UI/pages/sign_up_success_page.dart';
import 'package:salv/UI/widgets/buttons.dart';

import '../../common/common.dart';

class SignupSetProfilPage extends StatefulWidget {
  static const routeName = '/signupsetprofil';
  const SignupSetProfilPage({super.key});

  @override
  State<SignupSetProfilPage> createState() => _SignupSetProfilPageState();
}

class _SignupSetProfilPageState extends State<SignupSetProfilPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 37),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Row(children: [Image.asset('assets/image/logo-png.png')]),
                  const SizedBox(
                    height: 53,
                  ),
                  Row(
                    children: [
                      Text(
                        "Masukkan Foto Profil \nuntuk Tanda Pengenal \nAnda",
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    padding: const EdgeInsets.all(35),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // final image = await selectImage();
                              setState(() {
                                // selectedImage = image;
                              });
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: lightBackgroundColor,
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: SvgPicture.asset(
                                      "assets/image/icon_upload.svg")),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            // widget.data.name!,
                            "Mimi Jinhiro",
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          CustomFilledButton(
                            title: "Daftar",
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SignupSuccessPage.routeName,
                                  (route) => false);
                            },
                          ),
                        ]),
                  ),
                ]))));
  }
}
//  Text(
//               "Join us to Unlock\nYour Growth",
//               style:
//                   blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//                 padding: const EdgeInsets.all(22),
//                 decoration: BoxDecoration(
//                     color: whiteColor, borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         final image = await selectImage();
//                         setState(() {
//                           selectedImage = image;
//                         });
//                       },
//                       child: Container(
//                         width: 120,
//                         height: 120,
//                         decoration: BoxDecoration(
//                             color: lightBackgroundColor,
//                             image: selectedImage == null
//                                 ? null
//                                 : DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image:
//                                         //get File Image path from selected image Xfile
//                                         FileImage(File(selectedImage!.path))),
//                             shape: BoxShape.circle),
//                         child: selectedImage != null
//                             ? null
//                             : Center(
//                                 child: Image.asset(
//                                 "assets/icon_upload.png",
//                                 width: 32,
//                                 height: 32,
//                               )),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Text(
//                       widget.data.name!,
//                       style: blackTextStyle.copyWith(
//                           fontSize: 18, fontWeight: medium),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
