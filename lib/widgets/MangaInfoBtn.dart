import 'package:flutter/material.dart';
import 'package:merdga/constants/constants.dart';

class MangaInfoBtn extends StatelessWidget {
  final IconData icon;
  final String title;

  const MangaInfoBtn({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: Constants.lightblue,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
