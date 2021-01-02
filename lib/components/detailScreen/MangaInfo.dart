import 'package:flutter/material.dart';
import 'package:merdga/widgets/MangaInfoBtn.dart';
import 'package:merdga/widgets/VertDivider.dart';

class MangaInfo extends StatelessWidget {
  final String mangaImg, mangaStatus, mangaAuthor;

  const MangaInfo({Key key, this.mangaImg, this.mangaStatus, this.mangaAuthor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 160,
                    width: 130,
                    child: Image.network(
                      mangaImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("By $mangaAuthor - $mangaStatus",
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MangaInfoBtn(
                  icon: Icons.play_arrow_outlined,
                  title: "Read",
                ),
                VertDivider(),
                MangaInfoBtn(
                  icon: Icons.format_list_bulleted_sharp,
                  title: "Chapters",
                ),
                VertDivider(),
                MangaInfoBtn(
                  icon: Icons.favorite_border_outlined,
                  title: "Favorite",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
