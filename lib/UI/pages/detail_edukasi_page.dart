import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:salv/common/common.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailEdukasiPage extends StatefulWidget {
  final String? idVideo;

  static const routeName = '/detailedukasi';

  const DetailEdukasiPage({super.key, this.idVideo});

  @override
  State<DetailEdukasiPage> createState() => _DetailEdukasiPageState();
}

class _DetailEdukasiPageState extends State<DetailEdukasiPage> {
  static String? videoId =
      "https://www.youtube.com/watch?v=eOerQ0ZM0rU&ab_channel=NarasiNewsroom";

  static String? getVideoID(String? url) {
    try {
      var video = YoutubePlayer.convertUrlToId(url!);
      return video!;
    } on Exception catch (exception) {
      print(exception);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Video ID : ${getVideoID(videoId)}");
  }

  final YoutubePlayerController _videoController = YoutubePlayerController(
      initialVideoId: getVideoID(videoId)!,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kembali"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            YoutubePlayer(
              controller: _videoController,
              liveUIColor: greenColor,
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        Flexible(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Buah-buahan",
                              style: greenTextStyle.copyWith(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "7 menit",
                              style: greyTextStyle.copyWith(fontSize: 8),
                            )
                          ],
                        )),
                        Flexible(
                            child: Container(
                          width: double.infinity,
                          child: Wrap(
                            children: [
                              Text(
                                "Cara membuat kompos dari sampah rumah tangga tanpa bau ",
                                style: blueTextStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )),
                        Flexible(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "1/2 Step",
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                        const SizedBox(
                          height: 8,
                        ),
                        Flexible(
                            child: Container(
                          child: Wrap(
                            children: [
                              Text(
                                "ini adalah deskripsi dari videonya dong........... hehehehehhehehehhehehehehheehhehehhehehehehhehehe",
                                style: greyTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        )),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          children: [
                            Text(
                              "Persiapan",
                              style: blueTextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Flexible(
                            child: Wrap(
                          children: [
                            Text(
                              "ini adalah persiapan dari potongan video ke 1 tutorialnya dong........... hehehehehhehehehhehehehehheehhehehhehehehehhehehe",
                              style: greyTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            )
                          ],
                        )),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Tahapan",
                              style: blueTextStyle.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "ini adalah persiapan dari potongan video ke 1 tutorialnya dong........... hehehehehheksakaskaksak",
                              style: greyTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Flexible(
                            child: Container(
                                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10, left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        // Icons.arrow_forward_ios,
                                        Icons.arrow_back_ios,
                                        color: greenColor,
                                      ))
                                ],
                              ),
                            ),
                            Text(
                              "Kembali",
                              style: blueTextStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        )))
                      ],
                    ),
                  ),
                )
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
