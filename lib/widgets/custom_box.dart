import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';
import 'header_container.dart';

class CustomBox extends StatelessWidget {
  const CustomBox(
      {super.key,
      required this.widget,
      required this.onPressed,
      required this.text,
      required this.headerText,
      required this.buttonText,
      required this.topPositionOfHeader,
      required this.rightPositionOfHeader,
      required this.width,
      required this.height,
      required this.headerTextFontSize});
  final Widget widget;
  final VoidCallback onPressed;
  final String text;
  final String headerText;
  final String buttonText;
  final double topPositionOfHeader;
  final double rightPositionOfHeader;
  final double width;
  final double height;
  final double headerTextFontSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffb0bcbc),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 370,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '$text',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              widget,
              CustomElevatedButton(
                backgroundColor: Color(0xffB8E893),
                textColor: Colors.black,
                text: buttonText,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
        Positioned(
          top: topPositionOfHeader,
          right: rightPositionOfHeader,
          child: HeaderContainer(
            headerTextFontSize: headerTextFontSize,
            headerText: headerText,
            weight: width,
            height: height,
          ),
        ),
      ],
    );
  }
}
