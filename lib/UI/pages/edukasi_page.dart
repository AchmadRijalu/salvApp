import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/detail_edukasi_page.dart';
import 'package:salv/UI/widgets/list_edukasi_widget.dart';
import 'package:salv/blocs/edukasi/edukasi_bloc.dart';
import 'package:salv/services/edukasi_services.dart';

import '../../common/common.dart';
import '../../shared/shared_methods.dart';

class EdukasiPage extends StatefulWidget {
  static const routeName = '/edukasi';
  const EdukasiPage({super.key});

  @override
  State<EdukasiPage> createState() => _EdukasiPageState();
}

class _EdukasiPageState extends State<EdukasiPage> {

  dynamic stateEdukasi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final edukasiState = context.read<EdukasiBloc>().state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EdukasiBloc, EdukasiState>(
        builder: (context, state) {
          if (state is EdukasiLoading) {
            return Center(
              child: CircularProgressIndicator(color: greenColor),
            );
          }
          if (state is EdukasiSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 44,
                      ),
                      Row(children: [Image.asset('assets/image/logo-png.png')]),
                      const SizedBox(
                        height: 14,
                      ),
                      Expanded(
                          child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Mengapa Limbah Makanan \nPenting?",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 46,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.edukasi!.data.length,
                                itemBuilder: (context, index) {
                                  var edukasi = state.edukasi!.data[index];
                                  return ListEdukasi(
                                    onTap: () {
                                      
                                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                                        return DetailEdukasiPage(edukasiId: edukasi.id,);
                                      },));
                                    },
                                    gambarLimbah:
                                    
                                        "assets/image/image_sampah.png",
                                    namaTutorial: edukasi.title,
                                    durasiVideo: 15,
                                    tipeLimbah: edukasi.category,
                                  );
                                },
                              )
                              // ListEdukasi(
                              //   gambarLimbah: "assets/image/image_sampah.png",
                              //   namaTutorial:
                              //       "Cara membuat kompos dari sampah rumah tangga tanpa bau",
                              //   durasiVideo: 15,
                              //   tipeLimbah: "Buah-buahan",
                              // )
                            ],
                          ),
                        ),
                      ))
                    ]),
              ),
            );
          }
          if (state is EdukasiFailed) {
            return Center(
              child: Text(
                "Terjadi Kesalahan :(",
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
