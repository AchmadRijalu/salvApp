import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/UI/pages/sign_up_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/forms.dart';
import 'package:salv/bloc/auth_bloc.dart';
import 'package:salv/models/sign_in_form_model.dart';
import 'package:salv/models/user_model.dart';

import '../../common/common.dart';
import '../../shared/shared_methods.dart';

class SigninPage extends StatefulWidget {
  static const routeName = '/signin';
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController katasandiController =
      TextEditingController(text: '');

  bool validate() {
    if (usernameController.text.isEmpty || katasandiController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            showCustomSnacKbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, HolderPage.routeName, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
          return Padding(
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
                          "Wah, limbah makanan \nmana yang ingin Anda cari \ntahu, yuk lihat-lihat!",
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 23, horizontal: 19),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(children: [
                        CustomFormField(
                          title: "Nama Pengguna",
                          controller: usernameController,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        CustomFormField(
                          title: "Kata Sandi",
                          controller: katasandiController,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Lupa Kata Sandi?",
                              style: greenTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        CustomFilledButton(
                          title: "Sign In",
                          onPressed: () {
                            if(validate()){
                              context.read<AuthBloc>().add(AuthLogin(SigninFormModel(password: katasandiController.text, username: usernameController.text)));
                            }
                            else{
                              showCustomSnacKbar(context, "Semua form harus diisi!");
                            }
                          },
                        ),
                        const SizedBox(
                          height: 17,
                        )
                      ]),
                    ),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(top: 81),
                      child: Column(children: [
                        CustomTextButton(
                          title: "Buat Akun Baru",
                          onPressed: () {
                            userList.last.type == "seller";
                            Navigator.pushNamed(context, SignupPage.routeName);
                          },
                        )
                      ]),
                    ))
                  ]),
            ),
          );
        },
      ),
    );
  }
}
