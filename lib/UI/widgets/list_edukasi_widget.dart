import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';

class ListEdukasi extends StatelessWidget {
  final String? tipeLimbah;
  final String? namaTutorial;
  final int? durasiVideo;
  final VoidCallback? onTap;
  final String? gambarLimbah;
  const ListEdukasi(
      {super.key,
      required this.durasiVideo,
      this.onTap,
      required this.namaTutorial,
      required this.gambarLimbah,
      required this.tipeLimbah});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 88,
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(gambarLimbah!), fit: BoxFit.fill)),
          )),

// DecorationImage(
          //           image: gambarLimbah == "" ? AssetImage(gambarLimbah!) : NetworkImage(gambarLimbah!) as ImageProvider, fit: BoxFit.fill)

          Expanded(
            flex: 2,
            child: Container(
              child: Column(children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tipeLimbah!,
                          style: greenTextStyle.copyWith(
                              fontSize: 8, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "${durasiVideo!.toString()} menit ",
                          style: greyTextStyle.copyWith(
                              fontSize: 8, fontWeight: FontWeight.w400),
                        )
                      ]),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                namaTutorial!,
                                style: blueTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w700),
                                overflow: TextOverflow.fade,
                              ),
                            )
                          ]),
                    ))
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
