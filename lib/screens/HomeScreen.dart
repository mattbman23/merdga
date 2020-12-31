import 'package:flutter/material.dart';
import 'package:merdga/components/MangaCard.dart';
import 'package:merdga/constants/constants.dart';
import 'package:merdga/widgets/BotNavItem.dart';
import 'package:web_scraper/web_scraper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;
  bool mangaLoaded = false;
  List<Map<String, dynamic>> mangaList;

  void navBarTap(int index) {
    setState(() {
      selectedNavIndex = index;
    });
  }

  void fetchManga() async {
    final webscraper = WebScraper(Constants.baseUrl);

    if (await webscraper.loadWebPage('/read')) {
      mangaList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a > img',
        ['src', 'alt'],
      );

      print(mangaList);
      setState(() {
        mangaLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchManga();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Merdga"),
        backgroundColor: Constants.darkgray,
      ),
      body: mangaLoaded
          ? Container(
              height: screenSize.height,
              width: double.infinity,
              color: Constants.balck,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Wrap(
                  runSpacing: 10,
                  spacing: 5,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${mangaList.length} mangas",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    for (int i = 0; i < mangaList.length; i++)
                      MangaCard(
                        mangaImg: mangaList[i]['attributes']['src'],
                        mangaTitle: mangaList[i]['attributes']['alt'],
                      ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constants.darkgray,
        selectedItemColor: Constants.lightblue,
        unselectedItemColor: Colors.white,
        currentIndex: selectedNavIndex,
        onTap: navBarTap,
        items: [
          botNavItem(Icons.explore_outlined, "EXPLORE"),
          botNavItem(Icons.favorite, "FAVORITE"),
          botNavItem(Icons.watch_later, "RECENT"),
          botNavItem(Icons.more_horiz, "MORE"),
        ],
      ),
    );
  }
}
