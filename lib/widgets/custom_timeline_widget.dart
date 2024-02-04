import 'package:flutter/material.dart';
import 'package:ziti_assignment/theme/colors.dart';
import 'package:ziti_assignment/utils/size_utils.dart';

class CustomTimelineWidget extends StatelessWidget {
  const CustomTimelineWidget(
      {super.key,
      required this.index,
      this.heading,
      this.imagePath,
      required this.description});
  final int index;
  final String? heading;
  final String? imagePath;
  final List<String> description;

  @override
  Widget build(BuildContext context) {
    List<Widget> getList() {
      List<Widget> points = [];
      for (int i = 0; i < description.length; i++) {
        points.add(Text(
          description[i],
          style: TextStyle(color: CustomColors.whiteColor, fontSize: 14.fSize),
        ));
      }
      return points;
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            heading.toString(),
            style: TextStyle(
                color: CustomColors.whiteColor,
                fontSize: 20.fSize,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Column(
          children: getList(),
        ),
        SizedBox(
          height: 20.h,
        ),
        imagePath != null
            ? SizedBox(
                height: 200.h,
                width: double.maxFinite,
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                ),
              )
            : Container(),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
