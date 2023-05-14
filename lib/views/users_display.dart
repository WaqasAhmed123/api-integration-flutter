import 'package:api_demo/controller/user_controller.dart';
import 'package:flutter/material.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({super.key});

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: FutureBuilder(
                future: getUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text("No data"));
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (Context, index) {
                          return ListTile(
                            title: Text(snapshot.data[index].username),
                            subtitle: Text(snapshot.data[index].email),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
