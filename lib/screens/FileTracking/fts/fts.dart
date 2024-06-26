import 'package:flutter/material.dart';
import 'package:fusion/Components/appBar.dart';
import 'package:fusion/Components/side_drawer.dart';
import 'package:fusion/screens/FileTracking/Create_file/create_file.dart';
import 'package:fusion/screens/FileTracking/View_drafts/view_drafts.dart';
import 'package:fusion/screens/FileTracking/Archive_File/archive_file.dart';
import 'package:fusion/screens/FileTracking/View_inbox/view_inbox.dart';
import 'package:fusion/screens/FileTracking/View_outbox/view_outbox.dart';
import 'package:fusion/screens/FileTracking/Track_file/track_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    return username ?? '';
  }
}

class RoundedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> getUsername() async {
      final userService = UserService();
      final username = await userService.getUsername();
      return username;
    }

    return Scaffold(
      appBar: DefaultAppBar().buildAppBar(),
      drawer: SideDrawer(),
      body: Column(
        children: [
          FutureBuilder(
            future: getUsername(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show loading indicator while fetching username
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final username = snapshot.data.toString();
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username, // Display fetched username
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),

          // Divider
          Divider(thickness: 1.0, color: Colors.grey[300]),

          // Rounded list view
          ListView.builder(
            shrinkWrap: true, // Prevent scrolling
            itemCount: 5,
            itemBuilder: (context, index) {
              final items = ['Compose File', 'Drafts', 'Archive', 'Outbox', 'Inbox'];
              final paths = [
                '/create_file', 
                '/view_drafts', 
                '/archive_file',
                '/view_outbox', 
                '/view_inbox', 
              ];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffCC7231), // Color code for #CC7231
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(items[index]),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () async {
                            final username = await getUsername();
                            switch (paths[index]) {
                              case '/create_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CreateFilePage(username: username)),
                                );
                                break;
                              case '/view_drafts':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DraftsPage(username: username)),
                                );
                                break;
                              case '/view_inbox':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InboxPage(username: username)),
                                );
                                break;
                              case '/archive_file':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ArchivePage(username: username,)),
                                );
                                break;
                              case '/view_outbox':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OutboxPage(username: username)),
                                );
                                break;
                            }
                          },
                        ), // Icon color white
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
