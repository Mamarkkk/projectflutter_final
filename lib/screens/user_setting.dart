import 'package:flutter/material.dart';

class UserProfileSettingsPage extends StatefulWidget {
  const UserProfileSettingsPage({super.key});

  @override
  State<UserProfileSettingsPage> createState() => _UserProfileSettingsPageState();
}

class _UserProfileSettingsPageState extends State<UserProfileSettingsPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Settings"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Update your name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to save the name goes here
                String updatedName = nameController.text;
                // For demonstration, we'll just print it
                print("Updated Name: $updatedName");
                // Optionally, show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Name updated successfully!")),
                );
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
