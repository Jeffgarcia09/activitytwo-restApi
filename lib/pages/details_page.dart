import 'package:activitytwo/model/user.dart';
import 'package:activitytwo/pages/todo.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final  User userData;

  const UserDetailsPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: Text(
                      '${userData.name?[0]}',
                    ),
                  ),
                  Column(
                    children: [
                      Text('${userData.name}', style: const TextStyle(fontSize: 30)),
                      Text(
                        '${userData.address?.street}, ${userData.address?.suite}',
                      ),
                      Text(
                        '${userData.address?.city}',
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('${userData.username}'),
                      leading: const Icon(Icons.person_outlined),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text('${userData.email}'),
                      leading: const Icon(Icons.alternate_email_outlined),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text('${userData.phone}'),
                      leading: const Icon(Icons.call_outlined),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text('${userData.website}'),
                      leading: const Icon(Icons.language_outlined),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text('${userData.company?.name}'),
                      leading: const Icon(Icons.business_outlined),
                    ),
                  ],
                ),
              ),
               Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const Todoss()),
              );
              },
              child: const Text('Show Todos'),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
