import 'package:activitytwo/components/navigation_drawer.dart';
import 'package:activitytwo/model/user.dart';
import 'package:activitytwo/pages/details_page.dart';
import 'package:activitytwo/services/users_services.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<User>> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }

  void userDetails(BuildContext context, User user) {
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
      iconTheme: const IconThemeData(),
      leadingWidth: 70,
      title: const Text(
        'Users List',
      ),
    ),
    body: Container(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<User>>(
              future: userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      User user = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              user.name != null && user.name!.isNotEmpty
                                  ? user.name![0].toUpperCase()
                                  : '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          title: Text("${user.name}"),
                          subtitle: Text("${user.phone}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.more_horiz_outlined),
                            onPressed: () {
                              userDetails(context, user);
                            },
                          ),
                          onTap: () {
                            userDetails(context, user);
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Errors: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
         
        ],
      ),
    ),
  );
}

}
