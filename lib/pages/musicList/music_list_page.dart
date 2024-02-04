import 'package:flutter/material.dart';
import 'package:ziti_assignment/data/song_data.dart';
import 'package:ziti_assignment/pages/musicPlayer/music_player_page.dart';
import 'package:ziti_assignment/theme/colors.dart';
import 'package:ziti_assignment/utils/size_utils.dart';

class MusicListPage extends StatelessWidget {
  const MusicListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Music List",
          style: TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 25.fSize,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: CustomColors.appBackgroundColor,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.v),
            height: double.maxFinite,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: songData.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MusicPlayerPage(currentData: songData[index]),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.v),
                  height: 60.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: CustomColors.listTileColor,
                    borderRadius: BorderRadius.circular(10.adaptSize),
                  ),
                  child: Text(
                    songData[index]['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 17.fSize,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
