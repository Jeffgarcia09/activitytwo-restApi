import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> userData;

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
                    backgroundColor: Color.fromARGB(255, 94, 178, 248),
                    child: Text(
                      '${userData['name'][0]}',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${userData['name']}',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '${userData['address']['street']}, ${userData['address']['suite']}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${userData['address']['city']}',
                        style: TextStyle(fontSize: 15),
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
                      title: Text('${userData['username']}'),
                      leading: Icon(Icons.person_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('${userData['email']}'),
                      leading: Icon(Icons.alternate_email_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('${userData['phone']}'),
                      leading: Icon(Icons.call_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('${userData['website']}'),
                      leading: Icon(Icons.language_outlined),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('${userData['company']['name']}'),
                      leading: Icon(Icons.business_outlined),
                    ),
                  ],
                ),
              ),
              // SignInBtn(
              //   onTap: () => signUserOut(context),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
