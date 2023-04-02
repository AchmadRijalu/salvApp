import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salv/UI/pages/jual_limbah_success_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/forms.dart';
import 'package:salv/blocs/transaksi/transaksi_bloc.dart';
import 'package:salv/firebase_options.dart';

import '../../common/common.dart';
import '../../models/jual_limbah_form_model.dart';
import '../../shared/shared_methods.dart';

class FormJualLimbahPage extends StatefulWidget {
  // final JualLimbahForm? jualLimbahForm;

  final String? userId;
  final String? adsId;
  final int? weight;
  final String? location;
  static const routeName = '/formjuallimbah';
  const FormJualLimbahPage({
    super.key,
    this.adsId,
    this.location,
    this.userId,
    this.weight,
  });

  @override
  State<FormJualLimbahPage> createState() => _FormJualLimbahPageState();
}

class _FormJualLimbahPageState extends State<FormJualLimbahPage> {
  dynamic penghasilanValue = "";

  final TextEditingController beratLimbahController =
      TextEditingController(text: '');

  final TextEditingController lokasiController =
      TextEditingController(text: '');

  var file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.adsId);
    print(widget.userId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Data Pengiriman")),
      body: BlocProvider(
        create: (context) => TransaksiBloc(),
        child: BlocConsumer<TransaksiBloc, TransaksiState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is TransaksiFailed) {
              showCustomSnacKbar(context, state.e);
            }
            if (state is createTransaksiSuccess) {
              Navigator.pushNamed(context, JualLimbahSuccessPage.routeName);
            }
          },
          builder: (context, state) {
            if (state is TransaksiLoading) {
              return Center(
                child: const CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 37),
              child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hai, tunggu dulu. \nSebelum Anda \nMengirim Tawaran, \nJangan lupa untuk\n Mengisi Form di bawah ini.",
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Berat Limbah yang Dibutuhkan",
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          penghasilanValue = beratLimbahController.text;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      controller: beratLimbahController,
                      decoration: InputDecoration(
                          suffix: Text(
                            "/Kilogram",
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          hintText: "Berat",
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    CustomFormField(
                      title: "Masukkan Lokasimu",
                      controller: lokasiController,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total Pendapatan: +Rp.",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                        Text(
                          penghasilanValue == ""
                              ? ""
                              : "${penghasilanValue}000",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    if (file != null) ...[
                      Center(
                        child: Image.file(
                          File(file!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                    ],
                    CustomFilledButton(
                      title: "Ambil Foto",
                      onPressed: () async {
                        //Function with imagePicker to open and save photo.
                        ImagePicker imagePicker = ImagePicker();
                        file = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        print('${file?.path}');
                      },
                    ),
                    const SizedBox(height: 22),
                    CustomFilledButton(
                      title: "Kirim Penawaran",
                      onPressed: () async {
                        await Firebase.initializeApp(
                            options: DefaultFirebaseOptions.currentPlatform);
                        //Take the sending DateTime
                        String photoName =
                            DateTime.now().millisecondsSinceEpoch.toString();

                        //Getting reference to storage root
                        Reference reference = FirebaseStorage.instance.ref();
                        Reference referenceDirectoryImages =
                            reference.child('images');

                        //Refer the image to be uploaded
                        Reference referenceImage =
                            referenceDirectoryImages.child('${file?.name}');

                        //Store the file
                        if (file != null) {
                          try {
                            referenceImage.putFile(File(file!.path));

                            //If Success:
                            // referenceImage.getDownloadURL();
                          } catch (e) {
                            //Nothing yet
                          }
                        }

                        JualLimbahForm jualLimbahForm = JualLimbahForm(
                            userId: widget.userId!,
                            advertisementId: widget.adsId!,
                            weight: int.parse(penghasilanValue),
                            location: lokasiController.text);

                        context
                            .read<TransaksiBloc>()
                            .add(CreateTransaksiSeller(jualLimbahForm));
                      },
                    ),
                    const SizedBox(
                      height: 13,
                    )
                  ]),
            );
          },
        ),
      ),
    );
  }
}
