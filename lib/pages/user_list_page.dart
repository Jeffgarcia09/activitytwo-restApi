import 'package:activitytwo/components/navigation_drawer.dart';
import 'package:activitytwo/pages/details_page.dart';
import 'package:activitytwo/services/users_services.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<dynamic>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchUserData();
  }

  void userDetails(BuildContext context, dynamic user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsPage(userData: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerOne(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        leadingWidth: 70,
        title: const Text(
          'Users List',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<dynamic> users = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 214, 234, 250),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 1.0,
                                spreadRadius: 1.0),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-2.0, -2.0),
                                blurRadius: 1.0,
                                spreadRadius: 1.0)
                          ]),
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 94, 178, 248),
                            child: Text(
                              user['name'][0],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(user['name']),
                          subtitle: Text(
                            user['phone'],
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.more_horiz_outlined,
                                color: Color.fromARGB(255, 117, 117, 117)),
                            onPressed: () {
                              userDetails(context, user);
                            },
                          ),
                          onTap: () {
                            userDetails(context, user);
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
