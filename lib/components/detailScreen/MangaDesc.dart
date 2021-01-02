import 'package:flutter/material.dart';
import 'package:merdga/constants/constants.dart';

class MangaDesc extends StatefulWidget {
  final String mangaDesc, mangaGenres;

  const MangaDesc({Key key, this.mangaDesc, this.mangaGenres})
      : super(key: key);

  @override
  _MangaDescState createState() => _MangaDescState();
}

class _MangaDescState extends State<MangaDesc> {
  bool readMore = false;

  void toggleRead() {
    setState(() {
      readMore = !readMore;
    });
  }

  Widget overMultiLine() {
    return (widget.mangaDesc.trim()).split(" ").length > 30
        ? GestureDetector(
            onTap: toggleRead,
            child: Text(
              readMore ? "Read less" : "Read more",
              style: TextStyle(
                color: Constants.lightblue,
                fontSize: 14,
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Divider(),
            Text(
              widget.mangaDesc.substring(13).trim(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              maxLines: readMore ? 100 : 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
            overMultiLine(),
            Divider(),
            Text(
              "Genres",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Divider(),
            Text(
              widget.mangaGenres,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
