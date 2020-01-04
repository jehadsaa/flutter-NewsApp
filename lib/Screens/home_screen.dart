import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';
import 'package:newsapp/screen_tab/whats_new.dart';
import 'package:newsapp/screen_tab/popular.dart';
import 'package:newsapp/screen_tab/favourites.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin { // سنكلتيكربروفايدر تقوم بماتبعة الفريمات وضرورية لعمل vsync:this
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: 0,
        length: 3,
        vsync:
            this); // nom.3 is number of menus in tabBar ,, initialIndex is mean always go to first(index 0) menu when programmer Run
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: false,
        //العنوان بشكل افتراضي في الاندرويد يكون على اليسار لكن في الايفون يكون في المركز لذلك نضع هذا الكود حتى العنوان في الايفون يكون في اليسار
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "WHAT'S NEW",
            ),
            Tab(
              text: "POPULAR",
            ),
            Tab(
              text: "FAVOURITES",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: Center(
        child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favourites(),
        ],controller: _tabController,),
      ),
    );
  }
}
