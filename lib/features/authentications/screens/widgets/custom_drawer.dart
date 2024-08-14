import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/features/authentications/screens/widgets/chat_page.dart';
import 'package:project1company/features/authentications/screens/widgets/logout_view.dart';
import 'package:project1company/features/authentications/screens/widgets/profile_show.dart';

import '../../../../utils/costants/const.dart';
import 'homePage.dart';

class CustomDrawer extends StatelessWidget {
  final TextStyle _textStyle = const TextStyle(color: kfirstColor);
  final Color _iconColor = kfirstColor;

  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('ADMIN', style: _textStyle),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: _iconColor),
            onTap: () {
              Get.to(const HomePage());
            },
            title: Text('Home page', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            leading: Icon(Icons.person, color: _iconColor),
            onTap: () {
              Get.to(const ProfileShow());
            },
            title: Text('Profile', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            leading: Icon(Icons.contact_mail, color: _iconColor),
            onTap: () {
              Get.to(ChatScreen());
            },
            title: Text('Contact', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            onTap: () {
              showAboutDialog(context: context, children: [
                const Text("""
You are accepting our terms and conditions when you uses this app
""")
              ]);
            },
            leading: Icon(Icons.article, color: _iconColor),
            title: Text('Terms and conditions', style: _textStyle),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: _iconColor),
            title: Text('Notifications', style: _textStyle),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                height: 20,
                width: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Divider(color: _iconColor),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings, color: _iconColor),
            title: Text('Settings', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.group, color: _iconColor),
            title: const Text('Show Users'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.work, color: _iconColor),
            title: Text('Show Employee', style: _textStyle),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Get.to(LogoutPage());
            },
            leading: Icon(Icons.exit_to_app, color: _iconColor),
            title: Text('Log Out', style: _textStyle),
          ),
        ],
      ),
    );
  }
}
