import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/holder_page.dart';
import 'package:salv/bloc/auth_bloc.dart';
import 'package:salv/shared/shared_methods.dart';

import '../../common/common.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class UbahDataProfilPage extends StatefulWidget {
  static const routeName = '/ubahdataprofil';
  const UbahDataProfilPage({super.key});

  @override
  State<UbahDataProfilPage> createState() => _UbahDataProfilPageState();
}

class _UbahDataProfilPageState extends State<UbahDataProfilPage> {
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;
    
    if (authState is AuthSuccess) {
      print(authState.user!.id);
      print(authState.user!.token);
      usernameController.text = authState.user!.username!;
      phoneController.text = authState.user!.phoneNumber!;
      passwordController.text = authState.user!.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Ubah Data Profil")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is AuthFailed) {
            showCustomSnacKbar(context, state.e.toString());
          }

          if (state is AuthSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           CustomFormField(
                              title: "Nama Pengguna / Username", controller:  usernameController,),

                          SizedBox(
                            height: 16,
                          ),

                           CustomFormField(
                            title: "Nomor Telepon",
                            keyBoardType: TextInputType.number,
                            controller:  phoneController,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //NOTE: EMAIL INPUT
                          CustomFormField(
                            controller: passwordController,
                            title: "Kata Sandi",
                            obscureText: true,
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          CustomFilledButton(
                            title: "Simpan",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )),
                ],
              ));
        },
      ),
    );
  }
}
