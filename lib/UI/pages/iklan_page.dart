import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/UI/pages/camera_page.dart';
import 'package:salv/UI/pages/detail_iklan_pabrik_page.dart';
import 'package:salv/UI/pages/detail_iklan_page.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah1_page.dart';
import 'package:salv/UI/pages/tambah_iklan_limbah2_page.dart';
import 'package:salv/UI/widgets/buttons.dart';
import 'package:salv/UI/widgets/list_iklan_widget.dart';
import 'package:salv/blocs/iklan/iklan_bloc.dart';
import 'package:salv/models/iklan_form_model.dart';
import 'package:salv/models/user_model.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../common/common.dart';
import '../../models/user_model.dart';
import '../../models/user_model.dart';
import '../../shared/shared_methods.dart';

class IklanPage extends StatefulWidget {
  static const routeName = '/iklan';
  const IklanPage({super.key});

  @override
  State<IklanPage> createState() => _IklanPageState();
}

class _IklanPageState extends State<IklanPage> {
  var usernameIklanA;
  String? userType;
  dynamic userId;

  dynamic getAdvertisementId;
  late IklanBloc _iklanBloc;
  bool isRefresh = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iklanBloc = IklanBloc()..add(IklanGetAll());
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      usernameIklanA = authState.user!.username!;
      userType = authState.user!.type;
      userId = authState.user!.id;

      // print(authState.user!.token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        onPressed: () async {
          await availableCameras().then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CameraPage(
                  cameras: value,
                ),
              )));
        },
        child: const Icon(Icons.camera_alt),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            isRefresh = true;
          });
          _iklanBloc.add(IklanGetAll());
          await Future.delayed(const Duration(milliseconds: 100))
              .timeout(const Duration(seconds: 3));
          setState(() {
            isRefresh = false;
          });
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 44,
                ),
                Row(children: [Image.asset('assets/image/logo-png.png')]),
                const SizedBox(
                  height: 17,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (userType == "buyer") ...[
                          buildTambahIklan(context, usernameIklanA),
                        ],
                        // Text(userList.length.toString()),
                        Row(
                          children: [
                            Text(
                              "Lihat Iklan yang \nsedang berlangsung",
                              style: blackTextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        if (userType == "seller") ...[
                          BlocProvider(
                            create: (context) => _iklanBloc,
                            child: BlocBuilder<IklanBloc, IklanState>(
                              builder: (context, state) {
                                if (state is IklanLoading && !isRefresh ||
                                    isRefresh) {
                                  return Container(
                                      margin: const EdgeInsets.only(top: 40),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: greenColor),
                                      ));
                                }
                                if (state is IklanGetSuccess) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.iklanSeller!.data.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var iklan =
                                          state.iklanSeller!.data[index];
                                      getAdvertisementId = iklan.id;
                                      return ListIklan(
                                        progressBarIndicator:
                                            iklan.ongoingWeight /
                                                iklan.requestedWeight,
                                        title: iklan.title,
                                        price: iklan.price,
                                        onGoingWeight: iklan.ongoingWeight,
                                        requestedWeight: iklan.requestedWeight,
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return DetailIklanPage(
                                                maxProgress:
                                                    iklan.requestedWeight,
                                                advertisementId: iklan.id,
                                                iklanProgress:
                                                    (iklan.ongoingWeight /
                                                        iklan.requestedWeight),
                                              );
                                            },
                                          ));
                                        },
                                      );
                                    },
                                  );
                                }
                                if (state is IklanFailed) {
                                  return Center(
                                    child: Text(
                                      "Terjadi Kesalahan :(",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 16, fontWeight: semiBold),
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          ),
                        ] else if (userType == "buyer") ...[
                          BlocProvider(
                            create: (context) =>
                                IklanBloc()..add(IklanGetAllBuyer(userId)),
                            child: BlocConsumer<IklanBloc, IklanState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state is IklanLoading) {
                                  return Container(
                                      margin: const EdgeInsets.only(top: 40),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            color: greenColor),
                                      ));
                                }

                                if (state is IklanBuyerGetSuccess) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.iklanBuyer!.data.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var iklan = state.iklanBuyer!.data[index];

                                      getAdvertisementId = iklan.id;
                                      String iklanDate = iklan.endDate;
                                      final iklanDateConv =
                                          iklanDate.indexOf("2023", 0);
                                      return ListIklanPabrik(
                                        title: iklan.title,
                                        progressBarIndicator:
                                            iklan.ongoingWeight /
                                                iklan.requestedWeight,
                                        ongoing_weight: iklan.ongoingWeight,
                                        requested_weight: iklan.requestedWeight,
                                        endDate: iklan.endDate
                                            .substring(0, iklanDateConv),
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return DetailIklanPage(
                                                advertisementId: iklan.id,
                                                iklanProgress:
                                                    iklan.ongoingWeight /
                                                        iklan.requestedWeight,
                                              );
                                            },
                                          ));
                                          // context
                                          //     .read<IklanBloc>()
                                          //     .add(IklanGetDetailBuyer(iklan.id));
                                        },
                                      );
                                    },
                                  );
                                }

                                if (state is IklanFailed) {
                                  return Center(
                                    child: Text(
                                      "Terjadi Kesalahan :(",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 16, fontWeight: semiBold),
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          )
                        ],
                      ]),
                ))
              ],
            )),
      ),
    );
  }
}

Widget buildTambahIklan(BuildContext context, String? usernameIklan) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: greyTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Hello ${usernameIklan}",
          style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 20),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          "Butuh limbah? \nYuk, buat iklan.",
          style: greenTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        ),
        const SizedBox(
          height: 22,
        ),
        CustomFilledButton(
          title: "Tambah Sekarang",
          height: 37,
          onPressed: () {
            Navigator.pushNamed(context, TambahIklanLimbah1Page.routeName,
                arguments: 1);
          },
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          "Butuh limbah makanan apapun untuk keperluan anda, langsung aja buat iklan",
          style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    ),
  );
}
