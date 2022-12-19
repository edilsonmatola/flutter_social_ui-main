import 'package:flutter/material.dart';

import '../data/data.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  ListTile _buildDrawerOptions(
      {required Icon icon, String? title, Function()? onTap}) {
    return ListTile(
      leading: icon,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  currentUser.backgroundImageUrl!,
                ),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                            currentUser.profileImageUrl!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      currentUser.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          /* HOME */
          _buildDrawerOptions(
            icon: Icon(
              Icons.home_outlined,
            ),
            title: 'Home',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          /* CHAT */
          _buildDrawerOptions(
            icon: Icon(Icons.chat_outlined),
            title: 'Chat',
            onTap: () {},
          ),
          /* LOCATION */
          _buildDrawerOptions(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            title: 'Location',
            onTap: () {},
          ),
          /* PROFILE */
          _buildDrawerOptions(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            title: 'Profile',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
          ),
          /* SETTINGS */
          _buildDrawerOptions(
            icon: Icon(Icons.settings_outlined),
            title: 'Settings',
            onTap: () {},
          ),
          Expanded(
            child: Align(
              /* Alinhamento no fundo central*/
              alignment: FractionalOffset.bottomCenter,
              child: /* LOGOUT */
                  _buildDrawerOptions(
                icon: Icon(Icons.logout_outlined),
                title: 'Log Out',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
