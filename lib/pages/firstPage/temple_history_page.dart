import 'package:flutter/material.dart';
import 'package:ziti_assignment/data/historical_tilmeline_data.dart';
import 'package:ziti_assignment/pages/musicList/music_list_page.dart';
import 'package:ziti_assignment/theme/colors.dart';
import 'package:ziti_assignment/utils/size_utils.dart';
import 'package:ziti_assignment/widgets/custom_timeline_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.forward),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MusicListPage(),
              ),
            );
          }),
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 70.h,
        centerTitle: true,
        title: Text(
          "Temple History",
          style: TextStyle(
              color: CustomColors.whiteColor,
              fontSize: 25.fSize,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: CustomColors.appBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
        child: ListView.builder(
            itemCount: historicalData.length,
            itemBuilder: (context, index) {
              var currentData = historicalData[index];
              return CustomTimelineWidget(
                index: index,
                description: currentData['data'],
                heading: currentData['heading'],
                imagePath: currentData['image'],
              );
            }),
      ),
    );
  }
}
