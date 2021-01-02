import 'package:flutter/material.dart';
import 'package:merdga/components/homeScreen/MangaCard.dart';
import 'package:merdga/components/homeScreen/MangaList.dart';
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
  List<Map<String, dynamic>> mangaUrlList;

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

      mangaUrlList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a',
        ['href'],
      );

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Merdga"),
        backgroundColor: Constants.darkgray,
      ),
      body: mangaLoaded
          ? MangaList(
              mangaList: mangaList,
              mangaUrlList: mangaUrlList,
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
