import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:happy/apihelper/rest_api_handler_data.dart';
// ignore: unused_import
import 'package:happy/constanta/constants_images.dart';
import 'package:happy/constanta/networkmanager.dart';
import 'package:happy/constanta/urlendpoints.dart';
import 'package:happy/model/youtube_model.dart';
// ignore: unused_import
import 'package:happy/src/netflix_screen.dart';
import 'package:happy/src/videoplayer_screen.dart';

class YouTubeScreen extends StatefulWidget {
  const YouTubeScreen({super.key});

  @override
  State<YouTubeScreen> createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  List<YoutubeModel> yuoTubeArr = [];

  @override
  void initState() {
    super.initState();
    getYouTubeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'YouTube',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: yuoTubeArr.length,
        itemBuilder: (context, index) {
          final youTube = yuoTubeArr[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VideoPlayerScreen(
                          videoUrl:
                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
                        ))),
            //youTubeObj: yuoTubeArr[index]
            child: SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFEDEE),
                      // borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 10.0),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CachedNetworkImage(
                          imageUrl: youTube.thumb,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 180,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Text(
                          youTube.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            youTube.description,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }

  getYouTubeDetails() async {
    Singleton().showLoader();
    final response =
        await RestApiHandlerData.getYouTubeData(URLEndPoints.youTubeUrl);
    setState(() {
      Singleton().hideLoader();
      yuoTubeArr = response;
    });
  }
}
