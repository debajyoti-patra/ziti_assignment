// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ziti_assignment/theme/colors.dart';
import 'package:ziti_assignment/utils/size_utils.dart';

class CustomPointWidget extends StatelessWidget {
  const CustomPointWidget({
    Key? key,
    required this.descriptionPoint,
  }) : super(key: key);
  final String descriptionPoint;
  @override
  Widget build(BuildContext context) {
    return Text(
      descriptionPoint,
      style: TextStyle(color: CustomColors.whiteColor, fontSize: 14.fSize),
    );
  }
}
