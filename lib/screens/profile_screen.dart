import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/user_model.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/posts_carousel.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController = PageController(viewportFraction: 0.8);
    _favoritesPageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      widget.user.backgroundImageUrl,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        image: AssetImage(
                          currentUser.profileImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
