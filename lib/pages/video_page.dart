import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _youtubeController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
        initialVideoId: 'bSo51Sa8_L0',
        flags: YoutubePlayerFlags(
            enableCaption: true,
            autoPlay: false,
            hideControls: false,
            disableDragSeek: true,
            mute: true,
            loop: false));

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _youtubeController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.live_tv),
              ),
              Text('TV'),
            ],
          ),
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(icon: Icon(Icons.notifications_none), onPressed: null)
          ],
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Card(
                child: Column(
                  children: [
                    YoutubePlayer(
                      controller: _youtubeController,
                      bottomActions: [
                        ProgressBar(
                          isExpanded: true,
                        ),
                        RemainingDuration()
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                'assets/images/taco.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Best Sandwich In Every State',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            );
          },
        ));
  }
}
