import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/costants/const.dart';
import 'homePage.dart';


class CustomDrawer extends StatelessWidget {
  final TextStyle _textStyle = const TextStyle(color: kfirstColor);
  final Color _iconColor = kfirstColor;

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
              Get.to(HomePage());
            },
            title: Text('Home page', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            leading: Icon(Icons.person, color: _iconColor),
            onTap: () {},
            title: Text('Profile', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            leading: Icon(Icons.contact_mail, color: _iconColor),
            onTap: () {},
            title: Text('Contact', style: _textStyle),
          ),
          Divider(color: _iconColor),
          ListTile(
            onTap: () {},
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
          Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.work, color: _iconColor),
            title: Text('Show Employee', style: _textStyle),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app, color: _iconColor),
            title: Text('Log Out', style: _textStyle),
          ),
        ],
      ),
    );
  }
}
