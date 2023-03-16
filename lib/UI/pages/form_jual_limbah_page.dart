import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/jual_limbah_success_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/forms.dart';
import 'package:salv/blocs/transaksi/transaksi_bloc.dart';

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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    CustomFormField(title: "Masukkan Lokasimu", controller: lokasiController,),
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
                    Spacer(),
                    CustomFilledButton(
                      title: "Kirim Penawaran",
                      onPressed: () {
                        JualLimbahForm jualLimbahForm = JualLimbahForm(
                            userId: widget.userId!,
                            advertisementId: widget.adsId!,
                            weight: int.parse(penghasilanValue),
                            location: lokasiController.text);
                            
                        context.read<TransaksiBloc>().add(CreateTransaksiSeller(jualLimbahForm));
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
