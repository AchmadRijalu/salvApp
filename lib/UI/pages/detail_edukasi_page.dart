import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salv/blocs/edukasi/edukasi_bloc.dart';
import 'package:salv/common/common.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailEdukasiPage extends StatefulWidget {
  final String? edukasiId;
  final String? idVideo;

  static const routeName = '/detailedukasi';

  const DetailEdukasiPage({super.key, this.idVideo, this.edukasiId});

  @override
  State<DetailEdukasiPage> createState() => _DetailEdukasiPageState();
}

class _DetailEdukasiPageState extends State<DetailEdukasiPage> {


  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kembali"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: BlocProvider(
          create: (context) =>
              EdukasiBloc()..add(EdukasiGetDetail(widget.edukasiId)),
          child: BlocBuilder<EdukasiBloc, EdukasiState>(
            builder: (context, state) {
              if (state is EdukasiLoading) {
                return Center(
                  child: CircularProgressIndicator(color: greenColor),
                );
              }
              if (state is EdukasiGetDetailSuccess) {
                return Container(
                    child: CarouselSlider.builder(
                        carouselController: carouselController,
                        itemCount: state.edukasiDetail!.data.children!.length,
                        itemBuilder: (context, index, realIndex) {
                          var edukasiIndex =
                              state.edukasiDetail!.data.children![index];

                          var videoId = edukasiIndex.video;
                          String? getVideoID(String? url) {
                            try {
                              var video = YoutubePlayer.convertUrlToId(url!);
                              return video!;
                            } on Exception catch (exception) {
                              print(exception);
                            } catch (e) {
                              rethrow;
                            }
                          }

                          final YoutubePlayerController _videoController =
                              YoutubePlayerController(
                                  initialVideoId: getVideoID(videoId)!,
                                  flags: const YoutubePlayerFlags(
                                      autoPlay: false, mute: false));

                          return Container(
                              child: Column(
                            children: [
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28),
                                      child: Column(
                                        children: [
                                          Flexible(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              // Text(
                                              //   edukasiIndex.implementation,
                                              //   style: greenTextStyle.copyWith(
                                              //       fontSize: 10,
                                              //       fontWeight: FontWeight.w600,
                                              //       overflow:
                                              //           TextOverflow.fade),
                                              // ),
                                              Text(
                                                "${edukasiIndex.duration.toString()} menit",
                                                style: greyTextStyle.copyWith(
                                                    fontSize: 8),
                                              )
                                            ],
                                          )),
                                          Flexible(
                                              child: Container(
                                            width: double.infinity,
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  "${edukasiIndex.title}",
                                                  style: blueTextStyle.copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          )),
                                          Flexible(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${currentIndex + 1}/ ${state.edukasiDetail!.data.children!.length} Step",
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                                  "${edukasiIndex.content}",
                                                  style: greyTextStyle.copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300),
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
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                                "${edukasiIndex.preparation}",
                                                style: greyTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "${edukasiIndex.implementation}",
                                                style: greyTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 26,
                                          ),
                                          Flexible(
                                              child: Container(
                                                  child: Column(
                                            crossAxisAlignment:
                                                currentIndex + 1 !=
                                                        state
                                                            .edukasiDetail!
                                                            .data
                                                            .children!
                                                            .length
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10, left: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      currentIndex + 1 !=
                                                              state
                                                                  .edukasiDetail!
                                                                  .data
                                                                  .children!
                                                                  .length
                                                          ? MainAxisAlignment
                                                              .end
                                                          : MainAxisAlignment
                                                              .start,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          if (currentIndex +
                                                                  1 ==
                                                              state
                                                                  .edukasiDetail!
                                                                  .data
                                                                  .children!
                                                                  .length) {
                                                            setState(() {
                                                              carouselController
                                                                  .previousPage();
                                                            });
                                                          } else {
                                                            setState(() {
                                                              carouselController
                                                                  .nextPage();
                                                            });
                                                          }
                                                        },
                                                        icon: Icon(
                                                          currentIndex + 1 !=
                                                                  state
                                                                      .edukasiDetail!
                                                                      .data
                                                                      .children!
                                                                      .length
                                                              ? Icons
                                                                  .arrow_forward_ios
                                                              : Icons
                                                                  .arrow_back_ios,
                                                          color: greenColor,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                currentIndex + 1 !=
                                                        state
                                                            .edukasiDetail!
                                                            .data
                                                            .children!
                                                            .length
                                                    ? "Selanjutnya"
                                                    : "Kembali",
                                                style: blueTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          )))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ));
                        },
                        options: CarouselOptions(
                            height: double.infinity,
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            onPageChanged: ((index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }))));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
