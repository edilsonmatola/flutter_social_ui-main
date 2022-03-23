import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/data.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/following_users.dart';
import '../widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    /* ViewPOrt is the amount of space that our posts will take in our page
    * controller, which is 80% = 0.8*/
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'A E M',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        /* We'll put the tab bar inside of the appbar*/
        bottom: TabBar(
          controller: _tabController,
          /* Change the thickness of the line */
          indicatorWeight: 3,
          /* Color of the text inside the tabs */
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          /* Change the color (not weighted)
          of the not focused (not selected) tab*/
          unselectedLabelStyle: TextStyle(
            fontSize: 18,
          ),
          tabs: [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      /* List view to be able to scroll up and down inside of our app*/
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          FollowingUsers(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
