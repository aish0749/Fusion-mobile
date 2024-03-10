import 'package:flutter/material.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// Assuming you have a model class for message or file data
class OutboxMessage {
  final String recipient;
  final String subject;
  final String snippet;
  final DateTime sentDate;
  final String? messageType; // Optional for message type (e.g., email, chat)

  OutboxMessage({
    required this.recipient,
    required this.subject,
    required this.snippet,
    required this.sentDate,
    this.messageType,
  });
}

class OutboxPage extends StatefulWidget {
  @override
  _OutboxPageState createState() => _OutboxPageState();
}

class _OutboxPageState extends State<OutboxPage> {
  final _designationController = TextEditingController();
  // Example data for two outbox messages
  Future<void> _submitForm() async {
  try {
    // Validate required fields
    if (_designationController.text?.isEmpty == true) {
      throw Exception('Designation required.');
    }

    // Retrieve token securely (replace with appropriate mechanism)

    var storageService = locator<StorageService>();
    if (storageService.userInDB?.token == null) {
      throw Exception('Token Error');
    }

    Map<String, String> headers = {
      'Authorization': 'Token ' + (storageService.userInDB?.token ?? ""),
      'Content-Type': 'application/json'
    };

    // Prepare query parameters
    final queryParams = {
      'username': '21BCS013',
      'designation': _designationController.text,
      'src_module': 'filetracking',
    };

    // Construct URL with encoded query parameters
    final Uri url = Uri.http('10.0.2.2:8000', '/filetracking/api/outbox/', queryParams);

    final client = http.Client();

    // Make GET request
    final response = await client.get(url, headers: headers);

    // Handle response
    if (response.statusCode == 200) {
      // Assuming the response body directly contains inbox data (no parsing needed)
      final outboxData = response.body;
      print(outboxData); // Print the inbox data for debugging or logging
      // Use the inboxData to display or process the fetched inbox files in your UI
    } else {
      // Handle error (e.g., print error message)
      print('Error fetching inbox data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle other exceptions (e.g., network errors, token errors)
    print('An error occurred: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outbox'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
     

            // Divider
            Divider(thickness: 1.0, color: Colors.grey[300]),

            // Form content
            Column(
              children: [
                // Title field (require
                // Designation field
                TextField(
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'View As',
                  ),
                ),

                // Send button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                      await _submitForm(
                      
                      );
                    },
                    child: Text('View'),
                                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

