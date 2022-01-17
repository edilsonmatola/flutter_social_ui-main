import 'package:flutter/material.dart';
import '../data/data.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  ListTile _buildDrawerOptions(Icon icon, String title, Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
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
            Icon(Icons.home_outlined),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          /* CHAT */
          _buildDrawerOptions(
            Icon(Icons.chat_outlined),
            'Chat',
            () {},
          ),
          /* LOCATION */
          _buildDrawerOptions(
            Icon(Icons.location_on_outlined),
            'Location',
            () {},
          ),
          /* PROFILE */
          _buildDrawerOptions(
            Icon(Icons.account_circle_outlined),
            'Profile',
            () => Navigator.pushReplacement(
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
            Icon(Icons.settings_outlined),
            'Settings',
            () {},
          ),
          Expanded(
            child: Align(
              /* Alinhamento no fundo central*/
              alignment: FractionalOffset.bottomCenter,
              child: /* LOGOUT */
                  _buildDrawerOptions(
                Icon(Icons.logout_outlined),
                'Log Out',
                () => Navigator.pushReplacement(
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
