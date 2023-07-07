import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarName extends StatelessWidget {
  const AppBarName({super.key, this.title, this.subTitle});

  final title;
  final subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title??''),
        Text(subTitle??'',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w200,
          ),)
      ],
    );
  }
}
