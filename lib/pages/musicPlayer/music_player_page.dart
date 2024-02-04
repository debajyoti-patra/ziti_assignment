// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:ziti_assignment/theme/colors.dart';
import 'package:ziti_assignment/utils/size_utils.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({
    super.key,
    required this.currentData,
  });
  final Map currentData;
  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  bool isPlaying = false;
  late final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();
  Duration _position = Duration.zero;
  Duration _totalDuration = Duration.zero;
  @override
  void initState() {
    _audioPlayer.open(Audio(widget.currentData['path']),
        showNotification: false, autoStart: false, loopMode: LoopMode.single);
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _audioPlayer.currentPosition.listen((event) {
      setState(() {
        _position = event;
      });
    });
    _audioPlayer.current.listen((event) {
      if (event != null) {
        setState(() {
          _totalDuration = event.audio.duration;
        });
      }
    });
    String formatDuration(Duration duration) {
      int minutes = duration.inMinutes;
      int seconds = duration.inSeconds % 60;

      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            // Customize the color, size, etc. of the back arrow button
            color: Colors.white,
            size: 30.0,
          ),
        ),
        elevation: 0.0,
        toolbarHeight: 70.h,
        centerTitle: true,
        title: Text(
          "Music Player",
          style: TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 25.fSize,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: CustomColors.appBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.h,
                child: Image.asset(
                  'assets/images/flat-cycles-1299936_640.png',
                  fit: BoxFit.cover,
                ),
              ),
              // Display song information or cover art
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Title : ' + widget.currentData['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 15.fSize,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 5.v,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Artist Name : ' + widget.currentData['artist_name'],
                    style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 15.fSize,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                width: double.maxFinite,
                child: Slider(
                  value: _position.inSeconds.toDouble(),
                  min: 0.0,
                  max: _totalDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _audioPlayer.seek(Duration(seconds: value.toInt()));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(_position),
                    style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formatDuration(_totalDuration),
                    style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              // Player controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        _audioPlayer
                            .seek(_position - const Duration(seconds: 10));
                      },
                      icon: const Icon(Icons.replay_10,
                          color: CustomColors.whiteColor)),
                  IconButton(
                    icon: Icon(
                      isPlaying == true ? Icons.pause : Icons.play_arrow,
                      color: CustomColors.whiteColor,
                    ),
                    iconSize: 48,
                    onPressed: () async {
                      if (isPlaying) {
                        _audioPlayer.pause();
                        print(isPlaying);
                      } else {
                        print(isPlaying);

                        // await _audioPlayer.open(
                        //     Audio(
                        //         'assets/musics/1_Jai Shree Ram _ Hansraj Raghuwanshi _ Ayodhya Ram Mandir Song 2024 _ Yug Ram Raj Ka(MP3_128K).mp3'),
                        //     showNotification: true,
                        //     loopMode: LoopMode.single);
                        _audioPlayer.play();
                        print(isPlaying);
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        _audioPlayer
                            .seek(_position + const Duration(seconds: 10));
                      },
                      icon: const Icon(Icons.forward_10,
                          color: CustomColors.whiteColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
