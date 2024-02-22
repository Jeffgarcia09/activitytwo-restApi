import 'package:activitytwo/components/drawer_item.dart';
import 'package:flutter/material.dart';

class NavigationDrawerOne extends StatelessWidget {
  const NavigationDrawerOne({super.key});

  void onItemPressed(BuildContext context, {required int index}) {}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'People',
                icon: Icons.people,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Chats',
                  icon: Icons.message_outlined,
                  onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                  name: 'Favourites',
                  icon: Icons.favorite_outline,
                  onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Setting', icon: Icons.settings, onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(name: 'Log out', icon: Icons.logout, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  headerWidget() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('lib/images/download.jpg'),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'kazuko Ryuuka',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              'k.ryuuka@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        )
      ],
    );
  }
}
