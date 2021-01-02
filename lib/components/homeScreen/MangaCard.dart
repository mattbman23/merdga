import 'package:flutter/material.dart';
import 'package:merdga/constants/constants.dart';
import 'package:merdga/screens/DetailScreen.dart';

class MangaCard extends StatelessWidget {
  final String mangaImg, mangaTitle, mangaUrlList;

  const MangaCard({Key key, this.mangaImg, this.mangaTitle, this.mangaUrlList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 130,
      child: GestureDetector(
        onTap: () {
          print(mangaUrlList);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                mangaImg: mangaImg,
                mangaLink: mangaUrlList,
                mangaTitle: mangaTitle,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              flex: 75,
              child: Container(
                child: Image.network(
                  mangaImg,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  mangaTitle,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Constants.darkgray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
