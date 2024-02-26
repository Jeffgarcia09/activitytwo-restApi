import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchTaskData() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3001/task'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    throw Exception('Failed to load task data');
  }
}

class Todoss extends StatefulWidget {
  const Todoss({Key? key}) : super(key: key);

  @override
  _TodossState createState() => _TodossState();
}

class _TodossState extends State<Todoss> {
  late Future<List<Map<String, dynamic>>> futureTasks;

  @override
  void initState() {
    super.initState();
    futureTasks = fetchTaskData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Data'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureTasks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No task data available');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final task = snapshot.data![index];
                  final bool isCompleted = task['isCompleted'] ?? false;

                  return ListTile(
                    title: Row(
                      children: [
                        Checkbox(
                          value: isCompleted,
                          onChanged: null,
                        ),
                        Center(child: Text('${task['task'] ?? ''}')),
                        const Spacer(),
                        // Checkbox(
                        //   value: !isCompleted,
                        //   onChanged: null,
                        // ),
                      ],
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
